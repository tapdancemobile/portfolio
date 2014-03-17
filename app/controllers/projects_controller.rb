class ProjectsController < ApplicationController
  
  def new
  	@project = Project.new
  end

  def show
  	@project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def edit
  	@project = Project.find(params[:id])
  end

  def update
  	@project = Project.find(params[:id])
  	@project.update_attributes(params[:project])
  	redirect_to @project
  end

  def create
  	@project = Project.new(app_params)
  	if @project.save
  		flash[:success] = "Project Created"
  		redirect_to @project
  	else
  		render 'new'
	 end
  end

  private
  def app_params
    params.require(:project).permit(:title, :description, :project_id)
  end

end
