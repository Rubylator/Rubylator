class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :projects, :through => :assignments

  def can_manage_project(project)
    canview = false
    self.assignments.each do |assignment|
      if assignment.project == project and assignment.role.id == Role::PROJECTADMIN
        canview = true
      end
    end
    canview
  end
end
