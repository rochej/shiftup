class Offer < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :offerer, class_name: :User, foreign_key: :offerer_id
  belongs_to :shift

  def accepted?
    type=='yes'
  end

end