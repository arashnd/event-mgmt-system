require "cloudinary"


class UsersController < ApplicationController

  get '/' do
    @users = User.all(:role => :user)
    erb :'users/index', layout: :dashboard_layout
  end

  get '/new/register' do
    erb :'users/new'
  end

  post '/new/register' do
    @user = User.new(params[:user])
    if @user.save
      env['warden'].set_user(@user)
      flash[:success] = "Welome Registration Successful"
      redirect '/'
    else
      @errors = @user.errors
      erb :'users/new'
    end
  end


  get '/edit' do

    erb :'users/edit', layout: :dashboard_layout
  end

  post '/update' do

    image = Cloudinary::Uploader.upload(params[:file][:tempfile], auth)

    user = params[:user]
    user[:dp_public_id] = image['public_id']
    user[:dp_format] = image['format']
    current_user.update(user)
    redirect '/users/edit'
  end

  get '/upload' do

    e = Cloudinary::Uploader.upload('/home/n3d0/Desktop/1.jpg', auth)
    e.inspect.to_s
  end

  get '/feedback' do
    erb :'users/feedback', layout: :dashboard_layout
  end

  post '/feedback' do
    feedback = Feedback.new(params[:feedback])
    feedback.user_id = current_user.id

    if feedback.save
      puts "saved"
      puts feedback.inspect
      redirect '/users/feedback'
    else
      puts "failed"
      flash[:error] = "Failed to save."
      redirect '/users/feedback'
    end
  end
end
