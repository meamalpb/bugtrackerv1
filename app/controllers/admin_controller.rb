
class AdminController < ApplicationController
  before_action :set_pid_uid, only: [:add_user, :delete_user]

  def add_user
    if check_permissions
      @project.users << @user
    end
    redirect_to project_user_show_path(@project)
  end

  def delete_user
    if check_permissions
      @project.users.delete(@user)
    end
    redirect_to project_user_show_path(@project)
  end

  private 
  def set_pid_uid
    @project = Project.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def check_permissions
    if current_user.id == Project.find(params[:id]).project_lead_id || current_user.role=='admin'
        return true 
    else
      return false
    end
  end

end
