require 'rails_helper'

describe 'Team', model: true do
  let(:team){create(:team_with_users)}
  it 'exists' do
    expect(team).to be_instance_of(Team)
  end
  it 'has members' do
    expect(team.users.length).to eq(5)
  end
  it 'has shifts' do
    team.users.first.shifts_given << create(:shift)
    team.save
    expect(team.shifts.first).to be_instance_of(Shift)
    expect(team.shifts.length).to eq(1)
  end
end