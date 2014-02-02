class UsersController < ApplicationController
	before_filter :authenticate_user, only:[:activity_wall]
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
				session[:user_id] = @user.id
        format.html { redirect_to activity_path, :notice=> 'User was successfully created.'}
      else
        format.html { render action: 'index' }
      end
    end
  end

  def activity_wall
    @question =  Question.new
  end
end