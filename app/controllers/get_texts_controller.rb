class GetTextsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def get_text
    message_body = params['Body']
    from_number = params['From']
    p "&" * 80
    p params
    @user = User.find(cell: from_number)
    @offer = Offer.new(type: message_body, offerer: @user)

    if @offer.accepted? || @offer.maybe? || @offer.refused?
      @offer.save
    end
    render nothing: true
  end

end