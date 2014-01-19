class Question
  include MongoMapper::Document

  key :user_id,ObjectId
  key :title,String, :required => true
  key :posted_at,Time, :required => true

  belongs_to :user

  def getUserName()
      self.user.username
  end

end