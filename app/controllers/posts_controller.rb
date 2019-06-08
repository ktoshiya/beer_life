class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @search = Post.ransack(params[:q])
    @search.sorts = 'drink_date desc' if @search.sorts.empty?
    @search_post = @search.result.page(params[:page])
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
        format.html { redirect_to user_path(current_user), notice: '投稿しました' }
        format.json { render :show, status: :created, location: user_path(current_user) }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_path(current_user), notice: '投稿を編集しました' }
        format.json { render :show, status: :ok, location: user_path(current_user) }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: '投稿を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
      if current_user.id != @post.user_id
        redirect_to(:users)
        flash[:alert] = "編集権限がありません。" 
      end
    end

    def post_params
      params.require(:post).permit(:beer_name, :content, :count, :drink_date, :user_id, :picture, :picture_cache, :remove_picture　)
    end
end
