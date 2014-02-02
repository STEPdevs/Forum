class User
  include MongoMapper::Document  
  key :username, String
  key :firstname, String
  key :lastname, String
  key :boy, Boolean
  key :date_of_birth, String
  key :email, String
	key :crypted_password, String  
  
  def self.authenticate(email, secret)
		if email.rindex("@")
			u = User.find_by_email(email)
    else u = User.find_by_username(email)
    end
    u && u.authenticated?(secret) ? u : nil
  end
	
  PasswordRequired = Proc.new { |u| u.password_required? }
  validates_presence_of :password, :if => PasswordRequired
  validates_presence_of :username, :boy,:email,:date_of_birth
  
  def authenticated?(secret)
    password == secret
  end
  
  def password
    if crypted_password.present?
      @password ||= BCrypt::Password.new(crypted_password)
    else
      nil
    end
  end
  
  def password=(value)
    if value.present?
      @password = value
      self.crypted_password = BCrypt::Password.create(value)
    end
  end
  
  def password_required?
   crypted_password.blank? || !password.blank?
  end
end