require "rails_helper"

describe 'User', model: true do
  before(:all) do
    @user = create(:user_with_offers)
    @user.shifts_given << create(:shift)
    @user.shifts_taken << create(:shift)
    @user.compute_points
    @user.save
  end

  it "has a name" do
    expect(@user.name).to eq("Roche")
  end
  it "can have a shift" do
    expect(@user.shifts_given.length).to eq(1)
  end
  it "can have an offer" do
    expect(@user.offers.count).to eq(5)
  end
  it 'gets points from taking shifts' do
    expect(@user.points).to eq(2)
  end

end
