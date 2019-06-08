class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order(drink_date: :desc).page(params[:page]).per(6)
    @count = current_user.posts.sum(:count)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: '投稿しました' }
        format.json { render :show, status: :created, location: posts_path }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: '投稿を編集しました' }
        format.json { render :show, status: :ok, location: posts_path }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: '投稿を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
      redirect_to(:users) unless current_user.id == @post.user_id
      flash[:alert] = "編集権限がありません。" 
    end

    def post_params
      params.require(:post).permit(:beer_name, :content, :count, :drink_date, :user_id, :picture, :picture_cache, :remove_picture　)
    end
end
