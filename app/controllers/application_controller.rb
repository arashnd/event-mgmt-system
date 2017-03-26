class ApplicationController < Sinatra::Base
  helpers do
    def current_user
      env['warden'].user
    end
  end
  set :views, File.expand_path('../../views', __FILE__)
  register Sinatra::Flash
end
