class TasksController < ApplicationController
  def index
    @task = Task.all
  end
  
  def new
    @task = Task.new 
  end
  
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
    
  
  end
  
  
  
  private
  def task_params
    params.require(:task).permit(:content)
  end
end