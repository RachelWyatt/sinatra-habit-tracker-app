class HabitsController < ApplicationController
  
  get "/habits" do
    @habits = Habit.all
    erb :"/habits/index"
  end
  
  get '/habits/new' do 
    erb :'/habits/new'
  end

  post '/habits' do
    redirect_if_not_logged_in
    if params[:description] != ""
      flash[:message] = "Your habit was successfully started!"
      @habit = Habit.create(description: params[:description], user_id: current_user.id)
      @day = Day.create(day: params[:day], habit_id: @habit.id)
      redirect "/habit/#{@habit.id}"
    else 
      flash[:message] = "There was an error."
      redirect "/habits/new"
    end
  end
  
  get "/habit/:id" do
     find_habit
     @day = @habit.days
     #Day.find_by(habit_id: params[:id])
    erb :'habits/show'
  end
  
  #index route for all habits
  
  get "/habits/:id/edit" do 
    find_habit
    redirect_if_not_logged_in
      if @habit.user == current_user
        erb :"/habits/edit"
      else 
        redirect "users/#{current_user.id}"
      end
  end
  
  patch "/habits/:id" do
    find_habit
    redirect_if_not_logged_in
      if @habit.user == current_user && params[:description] != ''
        @habit.update(id: params[:id], description: params[:description])
        @day= Day.create(day: params[:day], habit_id: @habit.id)
        redirect to "/habit/#{@habit.id}"
      else 
        redirect "users/#{current_user.id}"
      end 
  end
  
  delete '/habit/:id' do 
    find_habit
    if current_user == @habit.user 
      @habit.destroy
      redirect "/"
    else 
      redirect "/habits"
    end
  end
  
  def find_habit
    @habit = Habit.find(params[:id])
  end 
  
end