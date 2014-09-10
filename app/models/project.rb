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
    unfinished_words = 0
    words = get_words(language)
    words.each do |word|
      unfinished_words += 1 if(word.text=="")
    end
    return 0 if words.length == 0
    100-(unfinished_words/(words.length/100.0)).round
  end

  def add_user(user, role)
    self.assignments << Assignment.new(user: user, role_id: role)
  end

  def remove_role_assignments
    Assignment.destroy_all(:project => self)
  end
end
