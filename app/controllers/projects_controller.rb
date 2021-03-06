class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def new
  	@project = Project.new({:name => "Default"})
  end

  def create
  	#params[:name],params[:description]
    @project = Project.new(project_params)
    if @project.save
    	redirect_to projects_path  
  	else
  		render('new')
    end
  # Strong Params
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
        redirect_to projects_path
      else
      render :action=>'edit'
    end  
  end

  def destroy
     @project = Project.find(params[:id])
     @project.destroy
     redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
  end

 private
  	def project_params
      params.require(:project).permit(:name, :description)

  	end
end
