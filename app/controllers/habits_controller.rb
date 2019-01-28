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
  
  get "/habit/:id" do
    find_habit
    erb :'habits/show'
  end
  
  #index route for all habits
  
  get "/habits/:id/edit" do 
    find_habit
    erb :"/habits/edit"
  end
  
  patch "/habits/:id" do
    find_habit
    @habit.update(id: params[:id], description: params[:description])
    redirect to "/habit/#{@habit.id}"
  end
  
  def find_habit
    @habit = Habit.find(params[:id])
  end 
  
end