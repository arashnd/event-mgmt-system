require 'sinatra/flash'
class Auth < Sinatra::Base

  register Sinatra::Flash

  get '/auth/unauthenticated' do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?

    flash[:error] = env['warden.options'][:message] || "You must be logged in"

    redirect '/auth/login'
  end


end
