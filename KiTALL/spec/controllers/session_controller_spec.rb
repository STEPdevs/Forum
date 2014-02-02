require 'spec_helper'

describe SessionController do
	it 'should login user with valid email id' do
		create(:user,{username:'user1',email:'aa@bb.com',password:'password'})
		post :create, session:{email:'aa@bb.com',password:'password'}
		response.should redirect_to activity_path
	end

	it 'should login user with valid username' do
		create(:user,{username:'user1',password:'pass',email:"aa@bb.com"})
		post :create, session:{email:'user1',password:'pass'}
		response.should redirect_to activity_path
	end

	it 'should not login user with invalid credenrials' do
		create(:user,{username:'user1',password:'pass',email:"aa@bb.com"})
		post :create, session:{email:'',password:'pass'}
		response.should_not redirect_to activity_path
		response.should redirect_to root_path
	end

	it "should sign out user" do
		create(:user,{username:'user1',password:'pass',email:"aa@bb.com"})
		post :create, session:{email:'',password:'pass'}
		response.should_not redirect_to activity_path
		delete :destroy
		response.should redirect_to root_path
	end
end