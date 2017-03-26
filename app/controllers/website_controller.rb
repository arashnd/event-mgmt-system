class WebsiteController < ApplicationController
  get '/' do
    erb :'website/index'
  end
  
  get '/protected' do
    env['warden'].authenticate!
    puts "protected"
    erb :protected
  end


end
