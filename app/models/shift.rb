class Shift < ActiveRecord::Base
  belongs_to :giver, class_name: :User, foreign_key: :giver_id
  belongs_to :taker, class_name: :User, foreign_key: :taker_id
  has_many :offers

  has_one :team, through: :giver, source: :team

  def determine_offer_status!
    self.covered = offers.any?(&:accepted?)
    self.save
  end

end