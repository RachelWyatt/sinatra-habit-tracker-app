class User < ActiveRecord::Base 
  has_secure_password
  has_many :habits
  has_many :days, through: :habits

end