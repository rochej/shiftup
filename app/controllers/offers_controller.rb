class OffersController < ApplicationController
  def create
    @offer = Offer.new(type: params["type"], shift_id: params[:shift_id])
    @offer.offerer = current_user
    @offer.save
    render json: @offer
  end


end