class Habit < ActiveRecord::Base
  belongs_to :user
  has_many :days
end
