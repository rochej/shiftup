class Offer < ActiveRecord::Base
  belongs_to :offerer, class_name: :User, foreign_key: :offerer_id
  belongs_to :shift
end