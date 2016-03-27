class ShiftsController < ApplicationController

def index
  @shifts = Shift.all
  respond_to do |format|
    format.html { render 'index'}
    format.json{ render json: @shifts }
  end
end

end
