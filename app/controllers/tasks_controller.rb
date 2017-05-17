
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_task, only:[:edit, :update, :show, :destroy, :change]
  def index
    @to_do = current_user.tasks.where(state: 'to_do')
    @doing = current_user.tasks.where(state: 'doing')
    @done = current_user.tasks.where(state: 'done')
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
  
  def change
    @task.update_attributes(state: params[:state])
    flash[:notice] = "Task status was successfully changed to #{@task.state}"
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:content, :state)
  end
  def find_task
    @task = Task.find(params[:id])
  end
end
