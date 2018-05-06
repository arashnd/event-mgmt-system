class MenusController < ApplicationController


  get '/:id' do
    @event = Event.get(params[:id])

    if @event.menu
      @menu = @event.menu
      erb :'menus/show', layout: :dashboard_layout
    else
      erb :'menus/new', layout: :dashboard_layout
    end
  end

  post '/:id/create' do
    @event = Event.get(params[:id])

    menu = Menu.new(params[:menu])
    menu.event_id = @event.id
    puts menu.inspect
    if menu.save
      puts "success"
      redirect "/dashboard/events/menu/#{menu.id}/items"
    else
      # show error
    end

  end

  get '/:id/items' do

    @catagories = Catagory.all
    @fooditems = Fooditem.all
    @menu = Menu.get(params[:id])

    @menu_items = @menu.menu_items

    erb :'menus/items', layout: :dashboard_layout
  end

  post '/:id/items' do

    menu = Menu.get(params[:id])

    menu_item = MenuItem.new(params[:menu_item])
    menu_item.menu_id = menu.id

    if menu_item.save
      "<h1>item saved</h1>"
    else
    end



  end


end
