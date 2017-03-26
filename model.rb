DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db.sqlite")

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, BCryptHash

  def authenticate(provided_password)
    self.password == provided_password
  end

end

DataMapper.auto_migrate!

if User.count == 0
  @user = User.create(email: "admin@login.com")
  @user.password = "password"
  @user.save
end
