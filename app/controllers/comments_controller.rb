class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post(@comment)
      flash[:notice] = "コメントしました。"
    else
      redirect_to post(@comment)
      flash[:danger] = @post.errors
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
