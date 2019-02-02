class UsersController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else
      flash[:error] = "Your credentials were invalid. Please sign up or try again."
      redirect "/login"
    end
  end
  
  get '/signup' do 
    erb :signup
  end
  
  post '/users' do 
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else
      flash[:error] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
      redirect '/signup'
    end
  end
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    @habits = Habit.all
    #how to update so this only shows habits owned by the user who is logged in?
    erb :'/users/show'
  end
  
  get '/logout' do 
    session.clear
    redirect '/'
  end
end