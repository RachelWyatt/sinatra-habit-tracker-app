class UsersController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  get '/signup' do 
    erb :signup
  end
  
end