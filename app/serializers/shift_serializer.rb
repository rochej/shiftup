class ShiftSerializer < ActiveModel::Serializer
  attributes :id, :datetime, :covered

  has_one :giver
  has_one :taker
  has_many :offers

  def datetime
    object.datetime.strftime("%a, %b %d %l:%m %p")
  end
end
