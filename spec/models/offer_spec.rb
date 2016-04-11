require 'rails_helper'

describe 'Offer', model: true do
  before(:all) do
    @offer = Offer.create(type: "no")
    @offer.shift = Shift.create()
    @offer.offerer = User.create(name: "Sue", team: Team.create(name: "Giants"))
  end
  it 'exists' do
    expect(@offer).to be_instance_of(Offer)
  end
  it 'has an offerer' do
    expect(@offer.offerer).to be_instance_of(User)
  end
  it 'responds to accepted? method' do
    expect(@offer.accepted?).to eq(false)
  end
  it 'responds to maybe? method' do
    expect(@offer.maybe?).to eq(false)
  end
  it 'responds to refused? method' do
    expect(@offer.refused?).to eq(true)
  end
  it 'can be forced to a yes' do
    expect{@offer.force_yes!}.to change{@offer.type}
  end
end
