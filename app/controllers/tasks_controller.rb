class TasksController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
  	@tasks = @project.tasks
  end

  def new
    @project = Project.find(params[:project_id])
  	@task = Task.new({:tname => "Default"})
  end

  def create
  	#params[:name],params[:description]
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    if @task.save
    	redirect_to project_tasks_path(@project)  
  	else
  		render :action=>'new'
    end
  # Strong Params
  end

  def edit
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks.find(params[:id])
   # @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks.find(params[:id])
  #  @task = Task.find(params[:id])
    if @tasks.update_attributes(task_params)
        redirect_to project_tasks_path(@project)
      else
      render :action=>'edit'
    end  
  end

  def destroy
     @project = Project.find(params[:project_id])
     @tasks = @project.tasks.find(params[:id])
    # @task = Task.find(params[:id])
     @tasks.destroy
     redirect_to project_tasks_path(@project)
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

 private
  	def task_params
      params.require(:task).permit(:project_id, :tname, :tdescrtion)

  	end
end
