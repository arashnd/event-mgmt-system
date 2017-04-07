class AdminController < ApplicationController
  get '/' do
    erb :'admin/index', layout: :dashboard_layout
  end
  get '/site/gallery' do
    erb :'admin/gallery'
  end

  post '/site/gallery' do

    image = Cloudinary::Uploader.upload(params[:file][:tempfile], auth)
    puts image['public_id']
    puts image
    puts image['format']
    redirect '/admin/site/gallery'

  end

end
