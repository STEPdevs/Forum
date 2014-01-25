class User
  include MongoMapper::Document  
  key :username, String
  key :firstname, String
  key :lastname, String
  key :boy, Boolean
  key :date_of_birth, Date
  key :email, String	
	key :crypted_password, String  
  
  def self.authenticate(email, secret)
    u = User.first(:conditions => {:email => email.downcase})
    u && u.authenticated?(secret) ? u : nil
  end
	
  PasswordRequired = Proc.new { |u| u.password_required? }
  validates_presence_of :password, :if => PasswordRequired
  validates_presence_of :username, :firstname,:lastname,:boy,:email,:date_of_birth
  
  def authenticated?(secret)
    password == secret ? true : false
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