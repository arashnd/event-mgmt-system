class GalleryImagesController < ApplicationController

  get '/' do
    @gallery_images = GalleryImage.all
    erb :'gallery_images/index', layout: :dashboard_layout
  end

  get '/image/new' do
    erb :'gallery_images/new', layout: :dashboard_layout
  end

  post '/image/upload' do
    image = Cloudinary::Uploader.upload(params[:file][:tempfile], auth)

    gallery_image = params[:gallery_image]
    gallery_image[:image_public_id] = image['public_id']
    gallery_image[:image_format] = image['format']

    gallery_image = GalleryImage.new(gallery_image)
    if gallery_image.save
      flash[:success] = "Uploaded successfully ..."
      redirect '/gallery/'
    else
      flash[:error] = "Error"
      redirect '/gallery/'
    end
  end
end
