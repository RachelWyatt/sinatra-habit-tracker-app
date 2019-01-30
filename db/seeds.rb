
dave = User.create(name: "Dave", email: "dave@gmail.com", password: "password")
sadie = User.create(name: "Sadie", email: "sadie@gmail.com", password: "password")

Habit.create(description: "Meow for more food than I actually need", user_id: dave.id)
Habit.create(description: "Greet Mom when she's home from work!", user_id: sadie.id)

Day.create(day: "Today", habit_id: 1)
Day.create(day: "January 31", habit_id: 2)