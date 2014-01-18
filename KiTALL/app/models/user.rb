class User
  include MongoMapper::Document

  key :name, String
  key :password, String

  has_many :questions, :foreign_key => :user_id, :class => User

end
