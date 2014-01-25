class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
		User.where session[:id]
  end

  def user_logged_in? id
  	session[:id].blank?
  end
end
