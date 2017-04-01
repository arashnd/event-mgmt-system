

class AdminController < ApplicationController


  get '/gallery/upload' do
    erb :'admin/gallery'
  end

  post '/gallery/upload' do

    image = Cloudinary::Uploader.upload(params[:file][:tempfile], auth)
    puts image['public_id']
    puts image
    puts image['format']
    redirect '/admin/gallery/upload'

  end

end
