class Word < ActiveRecord::Base
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
end
