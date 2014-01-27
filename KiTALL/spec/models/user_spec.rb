require 'spec_helper'
describe User do
  before(:each) do
    @user = build(:user)
  end  

	it 'should create user with encrypted password' do
		user = create(:user)
	  authenticated_user = User.authenticate(user.username, user.password)
	  expect(authenticated_user.email).to eq(user.email)
	end

	{username: "",firstname: "",lastname: "",email: "",password: ""}.each do |field,value|
		it "should not create user if #{field} is blank" do
			build(:user, {field=> value}).should_not be_valid
		end
	end
end