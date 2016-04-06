class OffersController < ApplicationController
  def create
    @shift = Shift.find(params[:shift_id])
    Offer.where("offerer_id=? AND shift_id=?", current_user.id, @shift.id).delete_all
    @offer = Offer.new(type: params["type"])
    @offer.shift = @shift
    @offer.offerer = current_user
    @shift.yes_offers?
    @shift.save
    @offer.save
    render json: @offer
  end


end