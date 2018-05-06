require 'bundler'
Bundler.require

# Cloudinary

Cloudinary.config do |config|
    config.cloud_name = #cloud_name,
    config.api_key = #api_key,
    config.api_secret = #api_secret_here
end

# Setup Database
#DataMapper::Logger.new($stdout, :debug)

file = File.expand_path('./config/database.yml')
options = YAML.load_file(file)

DataMapper.setup(:default, options['development'])

# Load all models

Dir['./app/models/*.rb'].each { |file| require file }

DataMapper.finalize
DataMapper.auto_upgrade!

# Load all controllers
require './app/controllers/application_controller'
Dir['./app/controllers/*.rb'].each { |file| require file }





# Use warden

use Rack::Session::Cookie, secret: "hkjhcklsdckldlc"

use Warden::Manager do |config|
  config.scope_defaults :default, strategies: [:password], action: 'unauthenticated'
  config.scope_defaults :sudo, strategies: [:admin], action: 'restricted'

  config.failure_app = AuthenticationController

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

# admin strategy##########

Warden::Strategies.add(:admin) do
  def valid?
    params['user'] && params['user']['email'] && params['user']['password']
  end

  def authenticate!
    user = User.first(email: params['user']['email'])
    if user.nil?
      fail("Email does not exists")
    elsif user.authenticate_admin(params['user']['password'])
      success!(user)
    else
      fail!("Invalid email password combination")
    end
  end
end

##########################

Warden::Manager.before_failure do |env, options|
  env['REQUEST_METHOD'] = 'POST'
end

# routes
map('/'){ run WebsiteController }
map('/auth') {run AuthenticationController}
map('/users') {run UsersController}
map('/admin') {run AdminController}
map('/dashboard/venues') {run VenuesController}
map('/dashboard/catagories') { run CatagoriesController }
map('/dashboard/fooditems') {run FooditemsController}
map('/dashboard/cities') { run CitiesController }
map('/dashboard/events') { run EventsController }
map('/dashboard/events/menu') { run MenusController } # to be refactored using regex
map('/gallery') { run GalleryImagesController }


# /\/dashboard\/events\/menu\/\d+\//
