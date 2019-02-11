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
      redirect "/habits/#{@habit.id}"
    else
      flash[:message] = "There was an error."
      redirect "/habits/new"
    end
  end

  get "/habits/:id" do
    redirect_if_not_logged_in
     find_habit

     if @habit
#       find_habit
        @day = @habit.days
       erb :'habits/show'
     else
       flash[:message] = "That habit doesn't exist yet!"
       redirect "/users/#{current_user.id}"
     end
  end

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

      if @habit.user == current_user && params[:description] != '' && params[:day] != ""
        @habit.update(id: params[:id], description: params[:description])
        @day = Day.create(day: params[:day], habit_id: @habit.id)
        flash[:message] = "Habit successfully updated!"
        redirect to "/habits/#{@habit.id}"
      else
        flash[:message] = "There was an error updating your habit. Please make sure the date section is filled in."
        redirect "/habits/#{@habit.id}"
      end
  end

  delete '/habits/:id' do
    find_habit
    if current_user == @habit.user
      @habit.destroy
      redirect "/"
    else
      redirect "/habits"
    end
  end

  def find_habit
    @habit = Habit.find_by_id(params[:id])
  end
end
