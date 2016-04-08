class ShiftsController < ApplicationController
  include SMSHelper

def index
  if current_user
    @shifts = current_user.team.shifts
    current_user.compute_points
  else
    @shifts = []
  end
  respond_to do |format|
    format.html { render 'index'}
    format.json{ render json: @shifts }
  end
end

def create
  date = params[:date]
  time = params[:time]
  datetime = Date.parse(date + " " + time)
  @shift = Shift.create(datetime: datetime, giver: current_user, covered: false)
  @shifts = current_user.team.shifts
  send_text(@shift)
  respond_to do |format|
    format.html { render 'index' }
    format.json { render json: @shifts}
  end

end


end
