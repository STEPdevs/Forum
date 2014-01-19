require 'spec_helper'
require 'question'

describe User do

  before(:each) do
    @user ={
        :username => "ravi2020",
        :firstname => "ravi",
        :lastname => "sharma",
        :sex => "male",
        :age =>"22",
        :email => "abc@gmail.com"
    }

  end

  it 'should create a user given all valid attributes' do
    lambda{
      User.create!(@user)
    }.should change(User, :count).by(1)
  end


  it 'should allow user to post a question' do
    testUser = User.create(@user)
    qestionToBePosted = Question.create({:title => "Test Question",:posted_at =>Time.now});
    lambda{
      testUser.post(qestionToBePosted)
    }.should change(testUser.questions, :count).by(1)
  end

  it 'should give list of questions asked by the given user' do
    testUser = User.create(@user)
    qestion1 = Question.new({:title => "Test Question1",:posted_at =>Time.now})
    qestion2 = Question.new({:title => "Test Question2",:posted_at =>Time.now})
    testUser.post(qestion1)
    testUser.post(qestion2)
    testUser.getAllQuestions().size().should == 2
    testUser.getAllQuestions()[0].title.should == "Test Question1"
    testUser.getAllQuestions()[1].title.should == "Test Question2"
  end


end