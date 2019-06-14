# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @user = User.new
    redirect_to user_path(current_user) if user_signed_in?
  end
end
