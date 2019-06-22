# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @title = 'ユーザー一覧'
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(drink_date: :desc).order(updated_at: :desc).page(params[:page])
    @post_count = @user.posts.count
    @likes = Post.joins(:likes).merge(Like.where(user_id: @user)).page(params[:page])
    @following = @user.following.page(params[:page])
    @followers = @user.followers.page(params[:page])
  end

  def following
    @title = 'フォロー一覧'
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'index'
  end

  def followers
    @title = 'フォロワー一覧'
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'index'
  end
end
