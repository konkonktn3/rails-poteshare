class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :current_user
  helper_method :current_post
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_post
    @current_post = Post.find_by(id: session[:post_id])
  end

  def login_required
    redirect_to login_path unless current_user
  end
    
end
