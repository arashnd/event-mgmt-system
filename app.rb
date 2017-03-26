class App < Sinatra::Base

  register Sinatra::Flash

  helpers do
    def current_user
      env['warden'].user
    end
  end

  get '/' do
    erb :index
  end

  get '/protected' do
    env['warden'].authenticate!
    puts "protected"
    erb :protected
  end

  get '/auth/login' do
    erb :login
  end

  post '/auth/login' do
    env['warden'].authenticate!

    flash[:success] = "Successfully logged in"

    if session[:return_to].nil?
      redirect '/'
    else
      redirect session[:return_to]
    end

  end

  get '/auth/logout' do
    env['warden'].logout
    flash[:success] = "Logged out successfully."
    puts "logged out"
    redirect '/'
  end

end
