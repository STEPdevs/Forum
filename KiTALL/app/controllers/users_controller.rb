class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_path, notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
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