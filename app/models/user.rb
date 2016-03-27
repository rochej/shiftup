class User < ActiveRecord::Base
  belongs_to :team
  has_many :shifts, as: :giver, foreign_key: :giver_id
  has_many :shifts, as: :taker, foreign_key: :taker_id
  has_many :offers, as: :offerer, foreign_key: :offerer_id
end