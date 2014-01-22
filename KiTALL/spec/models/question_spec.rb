require 'spec_helper'
require 'user'

describe Question do

  before(:each) do
    @question = build(:question)
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


  it "should save a question" do
    lambda{
      @question.save
    }.should change(Question, :count).by(1)
  end


  it 'should verify that question is saved' do
    @question[:title]="what is your name"
    @question.save

     actual=@question.getQuestionsHavingTitle("what is your name")
     actual[0].title.should eql "what is your name"
  end

  it 'should give the name of the Question seeker' do
    questionTobeAsked=build(:question)
    testUser = build(:user)
    testUser.post(questionTobeAsked)

    questionTobeAsked.getUserName().should == "ravi2020"
  end

end