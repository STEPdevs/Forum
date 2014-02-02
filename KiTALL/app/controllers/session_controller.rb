class SessionController < ApplicationController
  def new
    render "session/_new"
  end

	def create
		user = User.authenticate(params[:session][:email],params[:session][:password])
		if user
			session[:user_id] = user.id
			redirect_to activity_path
		else
			redirect_to :root
		end
	end

  def destroy
		session[:user_id] = nil
		redirect_to :root
  end
end