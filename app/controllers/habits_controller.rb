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
  
  get "/habits/:id" do
    @habit = Habit.find(params)
    erb :'habits/show'
  end
  
  #index route for all habits
  
  get "/habits/:id/edit" do 
    erb :"/habits/edit"
  end
  
end