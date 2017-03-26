class UsersController < ApplicationController
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
end
