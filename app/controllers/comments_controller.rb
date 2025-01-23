class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @task, notice: "Comment was successfully created."
    else
      redirect_to @task, alert: "Comment could not be created."
    end
  end

  def destroy
    @comment.destroy
    redirect_to @task, notice: "Comment was successfully deleted."
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = @task.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
