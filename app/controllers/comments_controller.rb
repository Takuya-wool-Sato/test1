class CommentsController < ApplicationController
	def create
    @comment = @task.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @task, notice: 'コメントを追加しました。'
    else
      render 'tasks/show'
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
