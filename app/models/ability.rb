class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Only Project Admins can manage projects
    can :manage, Project do |project|
      user.can_manage_project(project)
    end
    # Every user can create a project
    can :create, Project
  end
end
