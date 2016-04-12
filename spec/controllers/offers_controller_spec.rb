require 'rails_helper'

describe OffersController, controller: true do
  before(:all) do
    @giver = create(:user_with_shifts_given)
    @shift = @giver.shifts_given.first
    @taker = create(:user)
  end
  describe 'post create' do
    it 'creates a new offer in the database' do
      login(@taker)
      expect{post :create, shift_id: @shift.id, type: "yes"}.to change(Offer, :count).by(1)
    end
    it 'removes any other offers by that user' do
      login(@taker)
      @shift.offers << Offer.create(offerer: @taker, type: "no")
      expect{post :create, shift_id: @shift.id, type: "yes"}.to change(Offer, :count).by(0)
    end
  end
end