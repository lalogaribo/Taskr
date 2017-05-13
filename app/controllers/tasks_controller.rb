class TasksController < ApplicationController
 # def index
  #  @task = Task.all
  #end
  
  def new
    @task = Task.new 
  end
  
  def create
    @task = Task.new(task_params)
  if  @task.save
    flash[:notice] = "Task was successfully created"
    redirect_to task_path(@task)
  else 
   
    render 'new'
  end
end

def show
  @task = Task.find(params[:id])
end
  
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
end