class Project < ActiveRecord::Base
  belongs_to :language
  has_and_belongs_to_many :languages
  has_many :assignments
  has_many :users, through: :assignments
  has_many :words

  def reference_words
    get_words language
  end

  def get_words(language)
    words.where language: language
  end

  def get_progress(language)
    allwords = get_words(self.language)
    allwords = allwords.where('text!=""')
    finished_words = 0
    words = get_words(language)
    words.each do |word|
      finished_words += 1 unless(word.text.empty?)
    end
    return 100 if allwords.length == 0
    ((finished_words*1.0/allwords.length*1.0)*100).round
  end

  def add_user(user, role)
    self.assignments << Assignment.new(user: user, role_id: role)
  end

  def remove_role_assignments
    Assignment.destroy_all(:project => self)
  end
end
