require 'spec_helper'
require 'user'

describe Question do

  before(:each) do
    @valid_attributes = {
        :title => "Test Question",
        :posted_at =>Time.now
    }
  end


  it 'must have a question' do
    question=Question.new
    question.should_not be_valid
  end


  it 'must have a posted time' do
    question=Question.new
    question.should_not be_valid
    question.errors_on(:posted_at).should_not be_nil
  end


  it "should create a question given all valid attributes" do
    lambda{
      Question.create!(@valid_attributes)
    }.should change(Question, :count).by(1)
  end


  it 'should verify that question is saved' do
    savedQuestion=Question.create(@valid_attributes)
    savedQuestion.title.should eql "Test Question"
  end

  it 'should give the name of the Question seeker' do
    questionTobeAsked=Question.new(@valid_attributes)
    testUser = User.create({:username => "ravi2020",:firstname => "ravi",:lastname => "sharma",
                            :sex => "male",:age =>"22",:email => "abc@gmail.com" })
    testUser.post(questionTobeAsked)

    questionTobeAsked.getUserName().should == "ravi2020"
  end

end