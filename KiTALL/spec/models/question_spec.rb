require 'spec_helper'

describe Question do
  before(:each) do
    @question = build(:question)
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