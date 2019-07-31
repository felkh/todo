class TasksController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index
    render json: Task.all
  end

  def update
    puts "hit the update spot"
    task = Task.find(params[:id])
    task.update_attributes(task_params)
    render json: task
  end

  def create
    task = Task.create(task_params)
    render json: task
  end

  private

  def task_params
    params.require(:task).permit(:done, :title)
  end
end