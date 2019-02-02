class User < ActiveRecord::Base 
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :habits
  has_many :days, through: :habits

end