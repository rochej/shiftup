class ShiftSerializer < ActiveModel::Serializer
  attributes :id, :datetime, :covered

  has_one :giver
  has_one :taker
end
