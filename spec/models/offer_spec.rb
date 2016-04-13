require 'rails_helper'

describe 'Offer', model: true do
  let(:offer){create(:offer)}
  it 'exists' do
    expect(offer).to be_instance_of(Offer)
  end
  it 'has an offerer' do
    expect(offer.offerer).to be_instance_of(User)
  end
  it 'responds to accepted? method' do
    expect(offer.accepted?).to eq(true)
  end
  it 'responds to maybe? method' do
    expect(offer.maybe?).to eq(false)
  end
  it 'responds to refused? method' do
    expect(offer.refused?).to eq(false)
  end
  it 'can be forced to a yes' do
    expect{offer.force_yes!}.to change{offer.type}
  end
end
