class IssuesController < ApplicationController
  before_action :set_project
  before_action :set_issue, only: [:show, :edit, :update, :destroy, :mark_done]

  def index
    @issues = @project.issues.recent
  end

  def show
  end

  def new
    @issue = @project.issues.build
  end

  def create
    @issue = @project.issues.build(issue_params)
    
    if @issue.save
      redirect_with_success(project_path(@project, issue_id: @issue.id), 'Issue was successfully created.')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @issue.update(issue_params)
      redirect_with_success(project_path(@project, issue_id: @issue.id), 'Issue was successfully updated.')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @issue.destroy
    redirect_with_success(project_issues_path(@project), 'Issue was successfully deleted.')
  end

  def mark_done
    if @issue.update(status: 'Closed')
      redirect_with_success(project_path(@project, issue_id: @issue.id), 'Issue was marked as done.')
    else
      redirect_with_error(project_path(@project, issue_id: @issue.id), 'Failed to mark issue as done.')
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_issue
    @issue = @project.issues.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :status, :priority)
  end
end