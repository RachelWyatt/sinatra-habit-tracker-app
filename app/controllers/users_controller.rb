class UsersController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect '/users/#{@user.id}'
    else 
      "Invalid credentials"
      #Redirect to login page
    end
  end
  
  get '/signup' do 
    erb :signup
  end
  
  post '/users' do 
  end
  
  get '/users/:id' do
    "This will be the users show route"
  end
  
end