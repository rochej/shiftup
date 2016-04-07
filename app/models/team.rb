class Team < ActiveRecord::Base
  has_many :users
  has_many :shifts, through: :users, source: :shifts_given
end