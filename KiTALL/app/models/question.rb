class Question
  include MongoMapper::Document
  attr_accessible :title, :title, :posted_at

  key :user_id,ObjectId
  key :title,String, :required => true
  key :posted_at,Time, :required => true

  belongs_to :user

  def getUserName()
      self.user.username
  end

  #@return [Array] question
  def  getQuestionsHavingTitle(title)
     Question.all({:title => title})
  end

end