class OffersController < ApplicationController
  def create
    @shift = Shift.find(params[:shift_id])
    @shift.offers.where(offerer_id: current_user.id).delete_all
    @offer = Offer.new(type: params["type"])
    @offer.shift = @shift
    @shift.covered = true if @offer.type == "yes"
    @offer.offerer = current_user
    @shift.save
    @offer.save
    render json: @offer
  end


end