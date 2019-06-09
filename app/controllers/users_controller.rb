class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(drink_date: :desc).page(params[:page]).per(6)
    @count = @user.posts.sum(:count)
  end
end