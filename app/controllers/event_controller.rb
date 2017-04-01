class EventsController < ApplicationController

  get '/' do
    @events = current_user.events
    erb :'events/index'
  end

  get '/:venue_id/book' do
    @venue = Venue.get(params[:venue_id])
    erb :'events/new'
  end

  post '/:venue_id/book' do
    event = Event.new(params[:event])
    event.user = current_user
    event.venue_id = params[:venue_id]
    if event.save
      flash[:success] = "Event Booked successfully"
      redirect '/dashboard/events/'
    else
      puts "failed to save.."
      puts event.errors.inspect
      flash[:error] = "Error #{params[:event].inspect}"
      redirect '/dashboard/events/'
    end
  end

end
