class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :projects, :through => :assignments

  def can_manage_project(project)
    self.assignments.where({role_id: Role::PROJECTADMIN, project: project}).count > 0
  end

  def can_view_project(project)
    self.assignments.where({role_id: Role::TRANSLATOR, project: project}).count > 0
  end
end
