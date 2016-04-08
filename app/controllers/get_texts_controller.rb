class GetTextsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def get_text
    message_body = params['Body']
    from_number = params['From']
    p "&" * 80
    p params

  end

end