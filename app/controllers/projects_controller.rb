class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.includes(:issues).all
  end

  def show
    @issues = @project.issues.recent
    @selected_issue = @project.issues.find_by(id: params[:issue_id]) if params[:issue_id].present?
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
      redirect_with_success(@project, 'Project was successfully created.')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_with_success(@project, 'Project was successfully updated.')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_with_success(projects_path, 'Project was successfully deleted.')
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end