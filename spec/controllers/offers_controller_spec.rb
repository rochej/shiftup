require 'rails_helper'

describe OffersController, controller: true do
  before(:all) do
    @giver = create(:user_with_shifts_given)
    @shift = @giver.shifts_given.first
    @taker = create(:user)
    @shift.offers << create(:offer)
  end
  before(:each) do
    @shift.reload
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
    it 'does not remove offers made by other users' do
      login(@taker)
      post :create, shift_id: @shift.id, type: "no"
      expect(@shift.offers.length).to eq(2)
    end
    it 'updates the shift covered status when a yes offer is made' do
      login(@taker)
      post :create, shift_id: @shift.id, type: "yes"
      expect(@shift.covered).to eq(true)
    end
    it 'updates the shift taker yes offer is made' do
      login(@taker)
      post :create, shift_id: @shift.id, type: "yes"
      expect(@shift.taker).to eq(@taker)
    end
  end
end