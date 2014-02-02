require 'spec_helper'

describe UsersController do
	it "should redirect to activity wall on successfull response" do
		post :create, user: {username:'user1',password:'password',boy:'true',date_of_birth:'12/12/12',email:'a@b.com'},format: :html
		response.status.should == 302
		response.should redirect_to "/activity"
	end

	it "should render index page on invalid data" do
		post :create, user:{},format: :html
		assigns(:user).errors[:boy].should == ["can't be blank"]
		assigns(:user).errors[:email].should == ["can't be blank"]
		assigns(:user).errors[:username].should == ["can't be blank"]
		assigns(:user).errors[:password].should == ["can't be blank"]
		assigns(:user).errors[:date_of_birth].should == ["can't be blank"]
		response.should render_template "index"
	end

	it "should create question instance" do
		get :activity_wall
		assigns(@question).should_not be_nil
	end
end