require "rails_helper"

describe 'Shift', model: true do
  before(:all) do
    @shift = create(:shift)
    @shift.offers << create(:offer)
  end

  it "exists" do
    expect(@shift).to be_instance_of(Shift)
  end
  it 'has a giver' do
    expect(@shift.giver).to be_instance_of(User)
  end
  it 'defaults to not covered' do
    expect(@shift.covered).to eq(false)
  end
  it 'has offers' do
    expect(@shift.offers.length).to eq(1)
  end
  it 'is covered with an affirmative offer' do
    expect{@shift.determine_offer_status!}.to change{@shift.covered}
  end


end