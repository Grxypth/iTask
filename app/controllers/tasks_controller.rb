class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    Rails.logger.debug "Task Params: #{task_params.inspect}"
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      Rails.logger.debug "Task Errors: #{@task.errors.full_messages.inspect}"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :category_id,
      :priority,
      :status,
      :due_date
    )
  end
end
