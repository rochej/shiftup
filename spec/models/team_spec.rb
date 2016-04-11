require 'rails_helper'

describe 'Team', model: true do
  before(:all) do
    @team = Team.create(name: 'Giants')
    @team.users << User.create(name: "Jack")
    @team.users << User.create(name: "Jill")
    @team.users.first.shifts_given << Shift.create()
    binding.pry
    @team.save
  end
  it 'exists' do
    expect(@team).to be_instance_of(Team)
  end
  it 'has members' do
    expect(@team.users.length).to eq(2)
  end
  it 'has shifts' do
    expect(@team.shifts.first).to be_instance_of(Shift)
  end
  it 'has shifts' do
    expect(@team.shifts.length).to eq(1)
  end
end