class AuthenticationController < ApplicationController

  get '/unauthenticated' do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?

    flash[:error] = env['warden.options'][:message] || "You must be logged in"

    redirect '/login'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    env['warden'].authenticate!

    flash[:success] = "Successfully logged in"

    if session[:return_to].nil?
      redirect '/'
    else
      redirect session[:return_to]
    end
  end

  get '/logout' do
    env['warden'].logout
    flash[:success] = "Logged out successfully."
    puts "logged out"
    redirect '/'
  end

end
