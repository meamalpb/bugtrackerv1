
class AdminController < ApplicationController
def add_user
  @project = Project.find(params[:id])
  @user = User.find(params[:user_id])
  @project.users << @user
  redirect_to project_user_show_path(@project)
end

def delete_user
  @project = Project.find(params[:id])
  @user = User.find(params[:user_id])
  @project.users.delete(@user)
  redirect_to project_user_show_path(@project)
end

end
