require 'json'

class EventsController < ApplicationController

  get '/' do
    if admin_user?
      @events = Event.all
    else
      @events = current_user.events
    end
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
      @event = Event.new(params[:event])

      @event.user_id = current_user.id

      puts "non XHR request"
      if @event.save
        flash[:success] = "Event booked Successfully..."
        redirect '/dashboard/events'
      else
        @cities = City.all
        event.errors.each { |e| p e }
        flash[:error] = "Failed"
        erb :'events/new' , layout: :dashboard_layout
      end
    end


  end


  get '/:id/show' do
    @event = Event.get(params[:id])

    erb :'events/show', layout: :dashboard_layout

  end
end
