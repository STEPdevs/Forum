class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :authenticate_user, except: [:index]
	helper_method :current_user

  def current_user
			return User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
		if current_user.nil?
			redirect_to :root
		end
  end
end