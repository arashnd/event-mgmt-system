class FooditemsController < ApplicationController

  before do
    env['warden'].authenticate! :admin, scope: :sudo
  end


  get '/' do
    @fooditems = Fooditem.all
    erb :'fooditems/index', layout: :dashboard_layout
  end

  get '/new' do
    @catagories = Catagory.all
    erb :'fooditems/new', layout: :dashboard_layout
  end

  post '/create' do
    fooditem = Fooditem.new(params[:fooditem])
    if fooditem.save
      flash[:success] = "Created successfully.."
      redirect '/dashboard/fooditems'
    else
    end
  end

  get '/:id/show' do
    @fooditem = Fooditem.get(params[:fooditem])
    erb :'fooditems/show'
  end

end
