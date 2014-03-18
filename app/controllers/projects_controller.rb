class ProjectsController < ApplicationController
  
  before_filter :authenticate_user!, except: [:show]

  def new
  	@project = Project.new
  end

  def show
  	@project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    
    if(@project.destroy)
      flash[:success] = "Your project has been deleted"
      redirect_to portfolio_path
    else
      flash[:error] = "Unable to delete your project"
      redirect_to @project
    end
  end

  def edit
  	@project = Project.find(params[:id])
  end

  def update
  	@project = Project.find(params[:id])

  	if(@project.update_attributes(app_params))
      flash[:success] = "Your project has been updated"
  	  redirect_to portfolio_path
    else
      flash[:error] = "Unable to update your project"
      redirect_to edit_project_path(@project)
    end
  end

  def create
  	@project = Project.new(app_params)
  	if(@project.save)
      flash[:success] = "Your project has been created"
      redirect_to portfolio_path
    else
      flash[:error] = "Unable to create your project"
      render 'new'
    end
  end

  private
  def app_params
    params.require(:project).permit(:title, :description, :project_id)
  end

end
