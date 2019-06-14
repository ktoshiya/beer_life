# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @title = 'ユーザー一覧'
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(drink_date: :desc).order(updated_at: :desc).page(params[:page]).per(6)
    @count = @user.posts.sum(:count)
  end

  def following
    @title = 'フォロー一覧'
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(10)
    render 'index'
  end

  def followers
    @title = 'フォロワー一覧'
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'index'
  end
end
