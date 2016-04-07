class ShiftsController < ApplicationController

def index
  @shifts = current_user.team.shifts
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
  respond_to do |format|
    format.html { render 'index' }
    format.json { render json: @shifts}
  end
end


end
