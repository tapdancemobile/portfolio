class PicturesController < ApplicationController

  before_filter :authenticate_user!

	def show
		@picture = Picture.find(params[:id])
	end

	def update
	  	@picture = Picture.find(params[:id])
	  	@picture.update_attributes(app_params)
	  	redirect_to @picture
  	end

  	def edit
  		@picture = Picture.find(params[:id])
  		@project = Project.find(params[:project_id])
  	end

  	def new
  		@picture = Picture.new
        @picture.project_id = params[:project_id]
  	end

  	def create

    project = Project.find(params[:picture][:project_id])
  	@picture = project.pictures.create(app_params)
  	if @picture.save
  		flash[:success] = "Picture Created"
  		redirect_to @picture
  	else
  		render 'new'
	 end
  end

private
  def app_params
    params.require(:picture).permit(:title, :image, :project_id)
  end

end
