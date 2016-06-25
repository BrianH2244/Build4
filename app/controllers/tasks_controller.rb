class TasksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def tasks
    if logged_in?
      @task = current_user.tasks.build
      @importantTasksfeed_items = current_user.importantTasksfeed.paginate(page: params[:page])
    end
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task created!"
      redirect_to tasks_path
    else
      @importantTasksfeed_items = []
      render 'tasks/tasks'
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "Task deleted"
    redirect_to request.referrer || root_url
  end

  private

    def task_params
      params.require(:task).permit(:importantTasks)
    end
    
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to root_url if @task.nil?
    end
end