class OffersController < ApplicationController
  def create
    @offer = Offer.new(type: params["type"])
    @shift = Shift.find(params[:shift_id])
    @offer.shift = @shift
    @shift.covered = true if @offer.type == "yes"
    @offer.offerer = current_user
    @shift.save
    @offer.save
    render json: @offer
  end


end