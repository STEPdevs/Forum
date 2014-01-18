class SessionController < ApplicationController
  def new
  end

  def create
    if(User.authenticate(params[:session][:email],params[:session][:password]) !=nil)
    end
    redirect_to new_session_path
  end

  def destroy
  end
end