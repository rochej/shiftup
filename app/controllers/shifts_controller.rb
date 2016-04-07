class ShiftsController < ApplicationController

def index
  @shifts = Shift.team_shifts(current_user)
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
  @shifts = Shift.team_shifts(current_user)
  respond_to do |format|
    format.html { render 'index' }
    format.json { render json: @shifts}
  end
end


end
