require 'bundler'
Bundler.require

# Setup Database
DataMapper::Logger.new($stdout, :debug)

file = File.expand_path('./config/database.yml')
options = YAML.load_file(file)

DataMapper.setup(:default, options['development'])


require './model'

DataMapper.auto_migrate!

if User.count == 0
  @user = User.create(email: "arash@naveed.com")
  @user.password = "password"
  @user.first_name = "Arash"
  @user.last_name = "Naveed"
  @user.save
end

require './app'
require './auth'




# Use warden

use Rack::Session::Cookie, secret: "hkjhcklsdckldlc"

use Warden::Manager do |config|
  config.scope_defaults :default, strategies: [:password], action: 'auth/unauthenticated'
  config.failure_app = Auth

  config.serialize_into_session { |user| user.id }
  config.serialize_from_session { |id| User.get(id) }
end

Warden::Strategies.add(:password) do
  def valid?
    params['user'] && params['user']['email'] && params['user']['password']
  end

  def authenticate!
    user = User.first(email: params['user']['email'])
    if user.nil?
      fail!("Email does not exists")
    elsif user.authenticate(params['user']['password'])
      success!(user)
      puts "authenticated"
    else
      fail!("Invalid email password combination")
    end
  end
end

Warden::Manager.before_failure do |env, options|
  env['REQUEST_METHOD'] = 'GET'
end


run App
