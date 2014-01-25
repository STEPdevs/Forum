class UsersController < ApplicationController
  before_action :set_user, only: [:show]
	
  def index
    @user = User.new
  end

  def show
  end  

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
      	session[:id] = @user.id
        format.html { redirect_to activity_path, notice: 'User was successfully created.' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

	def activity_wall
	end
end