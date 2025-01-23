class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    @tasks =
      if params[:category_ids].present?
        current_user.tasks.where(category_id: params[:category_ids])
      else
        current_user.tasks
      end
  end

  def new
    @task = Task.new
  end

  def show
    @comments = @task.comments
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

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
