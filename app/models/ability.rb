class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin
      can :manage, :all
      return
    end

    # Only Project Admins can manage projects
    can :manage, Project do |project|
      user.can_manage_project(project)
    end

    # Translators can view Projects
    can :read, Project do |project|
      user.can_view_project(project)
    end

    # Every user can create a project
    can :create, Project
  end
end
