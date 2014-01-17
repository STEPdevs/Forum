class User
	include MongoMapper::Document  
  key :name, String, :required => true
  key :sex, String
end