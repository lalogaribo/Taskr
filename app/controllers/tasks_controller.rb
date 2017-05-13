
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_task, only:[:edit, :update, :show, :destroy]
    def index
    @task = current_user.tasks
  end
  
    def new
    @task = Task.new 
  end
    def edit
      end

  def create
    @task = current_user.tasks.new(task_params)
    if  @task.save
      flash[:notice] = "Task was successfully created"
      redirect_to task_path(@task)
    else 
      render 'new'
    end
  end

  def update
        if @task.update(task_params)
      flash[:notice] = "Task was successfully updated"
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end

  def show
      end

  def destroy
    if @task.destroy
      flash[:notice] = "Task #{@task.content}, was successfully destroyed"
      redirect_to tasks_path
    end
  end

      private
    def task_params
    params.require(:task).permit(:content)
  end
    def find_task
    @task = Task.find(params[:id])
  end
end
