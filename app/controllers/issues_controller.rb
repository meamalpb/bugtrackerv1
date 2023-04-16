class IssuesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @issue = @project.issues.create(issue_params)
    redirect_to project_path(@project)
  end

  private
    def issue_params
      params.require(:issue).permit(:Title, :Severity,:body)
    end

end
