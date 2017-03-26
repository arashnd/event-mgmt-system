class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :password, BCryptHash

  def authenticate(provided_password)
    self.password == provided_password
  end

end
