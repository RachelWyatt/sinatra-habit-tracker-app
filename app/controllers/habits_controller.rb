class HabitsController < ApplicationController
  
  get '/habits/new' do 
    erb :'/habits/new'
  end

  post '/habits' do
    if !logged_in?
      redirect '/'
    end
    if params[:description] != ""
      @habit = Habit.create(description: params[:description], user_id: current_user.id)
      redirect "/habit/#{@habit.id}"
    else 
      redirect "/habits/new"
    end
  end
  
  
  #show route for one habit 
  
  #index route for all habits
  
end