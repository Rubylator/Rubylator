class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :translate]
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @languages = @project.languages
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      @project.add_user(current_user, Role::PROJECTADMIN)

      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.remove_role_assignments
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  def translate
    @ref_language = @project.language
    @target_language = Language.find(params[:target_language])
  end

  def show_collaborators
    @roles = Role.get_roles
  end

  def add_collaborator
    user = User.find_by_email(params[:email])
    unless user
      redirect_to show_collaborators_project_url(@project), notice: "Could not find user with email #{params[:email]}"
      return
    end
    if @project.assignments.where({role_id: params[:role_id], user: user}).any?
      # User already has this role, redirect silently
      redirect_to show_collaborators_project_url(@project), notice: "User #{user.email} is already assigned to project #{@project.name}."
      return
    end

    # Finally add the user to the project
    if @project.add_user(user, params[:role_id])
      redirect_to show_collaborators_project_url(@project), notice: "User #{user.email} has been added to project #{@project.name}."
    else
      redirect_to show_collaborators_project_url(@project), notice: "Could not add user #{user.email} to project #{@project.name}."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :language_id, :language_ids => [])
    end
end
