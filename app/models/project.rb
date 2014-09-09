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

  def add_user(user, role_id)
    self.assignments << Assignment.new(user: user, role_id: role_id)
  end

  def remove_role_assignments
    Assignment.destroy_all(:project => self)
  end
end
