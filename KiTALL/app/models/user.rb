

class User
  include MongoMapper::Document

  key :password, String
  key :username, String
  key :firstname, String
  key :lastname, String
  key :sex, String
  key :age, String
  key :email, String
	key :password_salt, String
	key :password_hash, String
	
	attr_accessor :password
  validates_presence_of :username,:firstname, :lastname, :sex, :age, :email
  validates_numericality_of :age
  has_many :questions, :foreign_key => :user_id, :class => User	
	attr_accessible :username,:firstname, :lastname, :sex, :age, :email
	before_save :encrypt_password
	
	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

  def encrypt_password
  	self.password_salt = BCrypt::Engine.generate_salt
  	self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end
end		
