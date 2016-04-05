class OffersController < ApplicationController
  def create
    @shift = Shift.find(params[:shift_id])
    @user = current_user
    Offer.where("offerer_id=? AND shift_id=?", @user.id, @shift.id).delete_all
    @offer = Offer.new(type: params["type"])
    @offer.shift = @shift
    @shift.covered = true if @offer.type == "yes"
    @offer.offerer = current_user
    @shift.save
    @offer.save
    render json: @offer
  end


end