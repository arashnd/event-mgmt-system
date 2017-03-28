class ApplicationController < Sinatra::Base

  helpers do
    def current_user
      env['warden'].user || env['warden'].user(:sudo)
    end

    def admin_user?
      current_user.role == :admin if current_user
    end
  end

  set :views, File.expand_path('../../views', __FILE__)

  register Sinatra::Flash

  not_found do
    erb :'not_found'
  end

end
