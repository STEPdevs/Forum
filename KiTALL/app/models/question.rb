class Question
  include MongoMapper::Document

  key :question,String, :required => true
  key :posted_at,Time, :required => true


  key :user_id , ObjectId
  belongs_to :user, :class => User

end