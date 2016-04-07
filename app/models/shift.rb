class Shift < ActiveRecord::Base
  belongs_to :giver, class_name: :User, foreign_key: :giver_id
  belongs_to :taker, class_name: :User, foreign_key: :taker_id
  has_many :offers

  has_one :team, through: :giver, source: :team

  def yes_offers?
    covered = nil
    self.offers.each do |offer|
      covered = true if offer.type == "yes"
    end
      covered == true ? self.covered = true : self.covered = false
  end

  def self.team_shifts(current_user)
    team_shifts = []
    @shifts = Shift.all
    @shifts.each do |shift|
      if shift.team == current_user.team
        team_shifts << shift
      end
    end
    return team_shifts
  end

end