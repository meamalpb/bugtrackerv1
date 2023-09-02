class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @user = User.find(@project.project_lead_id)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        p "this"
        p project_params
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    if (current_user.id==@project.project_lead_id || current_user.role=='admin') 
        respond_to do |format|
          if @project.update(project_params)
            format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
            format.json { render :show, status: :ok, location: @project }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @project.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  def project_user
    @projects = Project.all
  end

  def project_user_show
    @project = Project.find(params[:id])
    @users = @project.users
    @allusers = User.where.not(id: @users.pluck(:id))
  end


  # DELETE /projects/1 or /projects/1.json
  def destroy
    if (current_user.id==@project.project_lead_id || current_user.role=='admin') 
      @project.destroy_with_issues

      respond_to do |format|
        format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :Description, :project_lead_id).tap do |whitelisted|
        whitelisted[:project_lead_id] = current_user.id
      end
    end


end
