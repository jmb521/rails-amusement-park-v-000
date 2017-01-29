class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in, :is_admin?, :authenticate_user
  def home

  end


  def current_user
   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize
   redirect_to '/signin' unless current_user
  end

  def logged_in?
    !!current_user

  end
  def is_admin?
    current_user.admin
  end

  def authenticate_user
    if !logged_in? 
      redirect_to root_path
    end
  end
end
