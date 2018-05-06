class CatagoriesController < ApplicationController

  get '/' do
    @catagories = Catagory.all
    erb :'catagories/index'
  end

  get '/new' do
    @catagories = Catagory.all
    erb :'catagories/new', layout: :dashboard_layout
  end

  post '/create' do
    catagory = Catagory.new(params[:catagory])

    if catagory.save
      flash[:success] = "Created successfully.."
      redirect '/dashboard/fooditems/new'
    else
    end
  end
end
