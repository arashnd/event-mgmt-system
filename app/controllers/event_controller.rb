require 'json'

class EventsController < ApplicationController

  get '/' do
    @events = current_user.events
    erb :'events/index', layout: :dashboard_layout
  end

  get '/?:venue_id?/book' do
    @cities = City.all
    erb :'events/new' , layout: :dashboard_layout
  end

  post '/?:venue_id?/book' do

    if request.xhr?
      puts "Request received"
      content_type :json

      city = City.get(params[:city_id])
      city.venues.to_json
    else
      # handle normal post request
    end


  end

end
