class OffersController < ApplicationController
  def create
    @shift = Shift.find(params[:shift_id])

    # if user has already responded to shift and is changing their response
    @shift.offers.where(offerer_id: current_user.id).delete_all
    @shift.update(taker_id: nil) if @shift.taker_id == current_user.id

    @offer = Offer.create(type: params["type"], shift: @shift, offerer: current_user)
    @shift.determine_offer_status!
    @offer.force_yes!
    @shift.taker = current_user if @offer.accepted?
    @shift.save
    current_user.compute_points
    render json: @offer
  end


end