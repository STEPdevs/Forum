class QuestionController  < ApplicationController
	before_filter :authenticate_user
  def post
      question=Question.new(params[:question])
      question.user=User.new
      question.posted_at=Time.now
      question.save
      redirect_to activity_path
    end
end