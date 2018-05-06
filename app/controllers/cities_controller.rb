class CitiesController < ApplicationController

  get '/' do
    @cities = City.all
    erb :'cities/index'
  end

  get '/new' do
    erb :'cities/new', layout: :dashboard_layout
  end

  post '/create' do
    city = City.new(params[:city])

    if city.save
      flash[:success] = "Created successfully.."
      redirect '/dashboard/cities/'
    else
    end
  end
end
