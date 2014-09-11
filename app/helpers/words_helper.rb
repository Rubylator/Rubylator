module WordsHelper
  def self.get_word_safe project, language, key
    word = project.get_words(language).where(key: key).first
    if word==nil
      word = Word.create_word key, '', project, language
    end
    word
  end
end
