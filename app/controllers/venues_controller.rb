class VenuesController < ApplicationController
  before do
    #env['warden'].authenticate! :admin, scope: :sudo
  end

  get '/' do
    @venues = Venue.all
    erb :'venues/index', layout: :dashboard_layout
  end

  get '/new' do
    @cities = City.all
    erb :'venues/new', layout: :dashboard_layout
  end

  post '/create' do
    venue = Venue.new(params[:venue])
    if venue.save
      flash[:success] = "Venue created successfully ..."
      redirect '/dashboard/venues/'
    else
      flash[:error] = "Error"
    end
  end

  get '/:id/show' do
    @venue = Venue.get(params[:id])
    erb :'venues/show'
  end
end
