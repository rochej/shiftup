require "rails_helper"

describe 'User', model: true do
  before(:all) do
    @user = User.create(name: "Person")
    @user.shifts_given << Shift.create()
    @user.shifts_taken << Shift.create()
    @user.offers << Offer.create()
    @user.compute_points
    @user.save
  end

  it "has a name" do
    expect(@user.name).to eq("Person")
  end
  it "can have a shift" do
    expect(@user.shifts_given.length).to eq(1)
  end
  it "can have an offer" do
    expect(@user.offers.length).to eq(1)
  end
  it 'gets points from taking shifts' do
    expect(@user.points).to eq(2)
  end

end
