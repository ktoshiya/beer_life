class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_follow
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_follow
  end

  private
    def respond_follow
      respond_to do |format|
        format.html
        format.js
      end
    end
end
