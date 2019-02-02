# Specifications for the Sinatra Assessment

Specs:

- [x] Use Sinatra to build the app

  I am using Sinatra to build my app

- [x] Use ActiveRecord for storing information in a database

  Yes, storing users and habits

- [x] Include more than one model class (e.g. User, Post, Category)

  User and Habit 

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

  User has many habits

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

  A habit belongs to a user

- [x] Include user accounts with unique login attribute (username or email)

  Use email for login

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
 
   User can create, read, update, and destroy journal entry.


- [X] Ensure that users can't modify content created by other users
  
  A logged in user can only edit and delete his or her habits.


- [X ] Include user input validations
  A habit can't be created with blank input, and during sign up the presence of Name, Email, and Password are validated.



- [X ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
  When a user has an error signing in, ActiveRecord tells them the error.


- [X ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  Yes


- [x] You have a large number of small Git commits
  Yes


- [x] Your commit messages are meaningful
  Yes


- [x] You made the changes in a commit that relate to the commit message
  Yes


- [x] You don't include changes in a commit that aren't related to the commit message
  Yes
