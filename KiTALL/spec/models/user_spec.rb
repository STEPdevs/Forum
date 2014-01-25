require 'spec_helper'
<<<<<<< Updated upstream
require 'question'

describe User do

  before(:each) do
    @user = build(:user)
  end

  it 'should create a user given all valid attributes' do
    lambda{
      @user.save
    }.should change(User, :count).by(1)
  end


  it 'should allow user to post a question' do
    testUser = create(:user)
    qestionToBePosted = build(:question)
    lambda{
      testUser.post(qestionToBePosted)
    }.should change(testUser.questions, :count).by(1)
  end

  it 'should give list of questions asked by the given user' do
    testUser = create(:user)
    question1 = build(:question,:title=>"Test Question1")
    question2 = build(:question,:title=>"Test Question2")

    testUser.post(question1)
    testUser.post(question2)
    testUser.getAllQuestions().size().should == 2
    testUser.getAllQuestions()[0].title.should == "Test Question1"
    testUser.getAllQuestions()[1].title.should == "Test Question2"
  end

=======

describe User do
	it 'should create user with encrypted password' do
		user = FactoryGirl.create(:user)
	  authenticated_user = User.authenticate(user.email, user.password)
	  expect(authenticated_user.email).to eq(user.email)
	end

	{username: "",firstname: "",lastname: "",email: "",password: ""}.each do |field,value|
		it "should not create user if #{field} is blank" do
			FactoryGirl.build(:user, {field=> value}).should_not be_valid
		end
	end
>>>>>>> Stashed changes
end