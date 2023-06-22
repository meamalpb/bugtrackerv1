class CommentsController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.build(comment_params)
    if @comment.save
      redirect_to project_issue_path(project_id: params[:project_id], id: params[:issue_id]), notice: 'Comment was successfully created.'
    else
      redirect_to project_issue_path(project_id: params[:project_id], id: params[:issue_id]), alert: 'Comment could not be created.'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body).tap do |whitelisted|
        whitelisted[:user_id] = current_user.id
      end
    end
end
