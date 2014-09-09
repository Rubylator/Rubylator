module WordsHelper
  def get_word_safe project, language, key
    word = project.get_words(language).where(key: key).first
    if word==nil
      word = Word.new(key: key, project: project, language: language, text: '')
      word.save
    end
    word
  end
end
