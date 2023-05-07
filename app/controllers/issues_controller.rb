class IssuesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @issue = @project.issues.create(issue_params)
    redirect_to project_path(@project)
  end

  def show
    p "Working?"
    p params[:id]
    @issue = Issue.find(params[:id])

  end

  private
    def issue_params
      params.require(:issue).permit(:Title, :Severity,:body,:assignee_id,:assigned_id).tap do |whitelisted|
        whitelisted[:assignee_id] = current_user.id
      end
    end

end
