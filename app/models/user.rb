class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :role, Enum[:admin, :user], default: :user
  property :email, String, required: true, format: :email_address, unique: true
  property :password, BCryptHash, required: true

  attr_accessor :password_confirmation
  validates_confirmation_of :password, :confirm => :password_confirmation
  validates_length_of :password_confirmation, min: 6

  def authenticate(provided_password)
    self.password == provided_password
  end

end
