class SessionController < ApplicationController
  def new
    render "session/_new"
  end

  def create
    if(User.authenticate(params[:session][:email],params[:session][:password]) !=nil)
    end
    redirect_to activity_path
  end

  def destroy
  end
end