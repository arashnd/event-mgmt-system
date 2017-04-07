class AuthenticationController < ApplicationController

  post '/unauthenticated' do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?

    flash[:error] = env['warden.options'][:message] || "You must be logged in"

    redirect '/auth/login'
  end

  post '/restricted' do
    flash[:error] = "Make sure you are admin"
    redirect '/auth/admin/login'
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

  get '/admin/login' do
    erb :login_admin
  end

  post '/admin/login' do
    env['warden'].authenticate! :admin, scope: :sudo
    flash[:success] = "Welcome back admin"

    redirect '/admin/'
  end


  get '/logout' do
    env['warden'].logout
    flash[:success] = "Logged out successfully."
    puts "logged out"
    redirect '/'
  end

end
