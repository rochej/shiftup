class Offer < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :offerer, class_name: :User, foreign_key: :offerer_id
  belongs_to :shift

  def accepted?
    type=='yes'
  end

  def maybe?
    type=='maybe'
  end

  def refused?
    type=='no'
  end

  def force_yes!
    self.type = 'yes' if self.shift.covered == false && self.shift.offers.count == (self.offerer.team.users.count - 1)
  end


end