class UsersController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      #log user in (create session)
      #redirect to user's landing page
    else 
      #tell user they entered invalid credentials
      #Redirect to login page
    end
  end
  
  get '/signup' do 
    erb :signup
  end
  
end