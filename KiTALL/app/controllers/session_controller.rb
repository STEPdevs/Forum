class SessionController < ApplicationController
  def new
    render "session/_new"
  end

  def create
    if(User.authenticate(params[:session][:email],params[:session][:password]) != nil)
    	p "new hello"
    	redirect_to activity_path    
  	else 
  		p "new hello----------------------------------------"
  		redirect_to users_path
		end
  end

  def destroy
  end
end