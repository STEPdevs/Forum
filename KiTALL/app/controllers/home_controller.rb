class HomeController < ApplicationController
	# before_filter :is_logged_in?, except:[:index]
	
	# def is_logged_in?
	# 	redirect_to activity_path if current_user
	# end
	
	def index
    @user = User.new
  end
end