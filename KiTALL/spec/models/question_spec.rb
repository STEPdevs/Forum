require 'spec_helper'

describe Question do

  before(:each) do
    @valid_attributes = {
        :question => "Test Question",
        :posted_at =>Time.now
    }
  end


  it 'must have a question' do
    question=Question.new
    question.should_not be_valid
  end


  it 'must have a posted time' do
    question=Question.new
    question.should_not be_valid       #calls question.valid?
    question.errors_on(:posted_at).should_not be_nil  #i want to make sure it doesn't fail bcz of question attribute
  end


  it "should create a question given all valid attributes" do
    lambda{
      Question.create!(@valid_attributes)
    }.should change(Question, :count).by(1)
  end

  it 'should verify that question is saved' do
    question=Question.create(@valid_attributes)

    #p question._id
    p Question.all

  end



end