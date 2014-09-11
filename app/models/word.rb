class Word < ActiveRecord::Base
  has_ancestry

  belongs_to :project
  belongs_to :language

  def translate
    translator = Rails.application.config.bing_translator
    test = translator.supported_language_codes
    return false unless test.include? self.project.language.locale[0..1]
    return false unless test.include? self.language.locale[0..1]
    val = translator.translate(self.project.reference_words.find_by(key: self.key).text,
                         from: self.project.language.locale[0..1], to: self.language.locale[0..1])
    update_column(:text, val)
  end

  def self.create_word key, text, project, language
    word = (Word.where ({key: key, language: language})).first
    unless word.nil?
      word.text = text
      word.save
      return word
    end
    parent_key = key.rpartition(':')[0]
    if parent_key.empty?
      Word.create! key: key, text: text, project: project, language: language
    else
      parent = (Word.where ({key: parent_key, language: language})).first
      if parent.nil?
        create_word parent_key, '', project, language
        parent = (Word.where ({key: parent_key, language: language})).first
      end
      Word.create! key: key, text: text, project: project, language: language, parent: parent
    end
  end
end
