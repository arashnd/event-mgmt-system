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

    image = Cloudinary::Uploader.upload(params[:file][:tempfile], auth)

    venue = params[:venue]
    venue[:venue_photo_public_id] = image['public_id']
    venue[:venue_photo_format] = image['format']

    venue = Venue.new(venue)
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
