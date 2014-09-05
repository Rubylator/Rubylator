class Project < ActiveRecord::Base
  belongs_to :language
  has_and_belongs_to_many :languages
  has_many :assignments
  has_many :users, through: :assignments

  def add_user(user, role)
    self.assignments << Assignment.new(user: user, role_id: role)
  end

  def remove_role_assignments
    Assignment.destroy_all(:project => self)
  end
end
