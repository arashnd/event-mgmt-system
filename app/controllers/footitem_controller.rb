class FooditemController < ApplicationController

  before do
    env['warden'].authenticate! :admin, scope: :sudo
  end


  get '/' do
    @fooditems = Fooditem.all
    erb :'fooditems/index'
  end

  get '/new' do
    erb :'fooditems/new'
  end

  post '/create' do
    fooditem = Fooditem.new(params[:fooditem])
    if fooditem.save
      flash[:success] = "Created successfully.."
      redirect '/dashboard/fooditems/index'
    else
    end
  end

  get '/:id/show' do
    @fooditem = Fooditem.get(params[:fooditem])
    erb :'fooditems/show'
  end

end
