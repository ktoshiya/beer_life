class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "コメントしました。"
      redirect_back(fallback_location: post_path(@post))
    else
      @comments = @post.comments.all.order(created_at: :desc)
      render "posts/show"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
