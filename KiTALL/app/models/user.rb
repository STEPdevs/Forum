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

  many :questions,
           :dependent => :destroy

  attr_accessor :password
  validates_presence_of :username,:firstname, :lastname, :sex, :age, :email
  validates_numericality_of :age
	attr_accessible :username,:firstname, :lastname, :sex, :age, :email
	before_save :encrypt_password
	
	def self.authenticate(email, password)
		user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
      puts user.email
    else
      nil
		end
	end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt()
  	self.password_hash = BCrypt::Engine.hash_secret(@password,password_salt)
  end

  def post(question)
    self.questions << question;
    self.save
  end

  def getAllQuestions()
    self.questions
  end

end