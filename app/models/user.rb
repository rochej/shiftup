class User < ActiveRecord::Base
  has_secure_password

  belongs_to :team
  has_many :shifts_given, class_name: :Shift, foreign_key: :giver_id
  has_many :shifts_taken, class_name: :Shift, foreign_key: :taker_id
  has_many :offers, as: :offerer, foreign_key: :offerer_id

  def compute_points
    self.points = shifts_taken.length * 2
  end
end