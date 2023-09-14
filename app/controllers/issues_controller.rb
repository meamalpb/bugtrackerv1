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
    @issue = Issue.find(params[:id])
    @assigned_id = User.find(@issue.assigned_id)
    @assignee_id = User.find(@issue.assignee_id)
    @comments = @issue.comments.includes(:user)
    @comment = @issue.comments.new
  end

  def myissues
    @issues = Issue.where(assignee_id:current_user.id)
  end

  private
    def issue_params
      params.require(:issue).permit(:Title, :Severity,:body,:assignee_id,:assigned_id).tap do |whitelisted|
        whitelisted[:assignee_id] = current_user.id
      end
    end

end
