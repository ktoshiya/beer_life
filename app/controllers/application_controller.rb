# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :request_path

  def after_sign_in_path_for(_resource)
    user_path(current_user)
  end

  def after_sign_up_path_for(_resource)
    user_path(current_user)
  end

  def correct_user
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      redirect_to(:users)
      flash[:alert] = '編集権限がありません。'
    end
  end

  def set_search
    @q = Post.ransack(params[:q])
    @q.sorts = 'drink_date desc', 'updated_at desc' if @q.sorts.empty?
    @posts = @q.result.page(params[:page])
  end

  def request_path
      @path = controller_path + '#' + action_name
      def @path.is(*str)
          str.map{|s| self.include?(s)}.include?(true)
      end
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[name email password password_confirmation image image_cache remove_image　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
