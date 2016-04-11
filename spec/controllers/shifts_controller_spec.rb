require 'rails_helper'

describe ShiftsController, controller: true do
  before(:all) do
    @user = User.create(email: "rochej@gmail.com", password: "password", team: Team.create(name:'Giants'))
    @shift = Shift.create(datetime: Date.today)
    @user.shifts_given << @shift
  end
  describe 'get index' do
    it "loads no shifts if user is not logged in" do
      get :index
      expect(assigns(:shifts)).to eq([])
    end
    it "loads shifts if they exist" do
      login(@user)
      get :index
      expect(assigns(:shifts)).to include(@shift)
    end
    it "renders index template" do
      get :index
      expect(response).to render_template :index
    end
    it "responds with 200 status" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  describe 'create shifts' do
    it 'saves a new shift to the database' do
      login(@user)
      expect{post :create, date: Date.today, time: Time.now}.to change(Shift, :count).by(1)
    end
    # it 'returns list of shifts' do
    #   expect(:assigns(:shifts))).to include(@shift)
    # end
    #
  end
end