class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	helper_method :current_user

  def current_user
			User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
		if current_user.nil?
			redirect_to :root
		end
  end
end