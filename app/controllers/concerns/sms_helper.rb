module SMSHelper

  def send_text
    number_to_send_to = "13232400224"

    @twilio_client = Twilio::REST::Client.new(ENV['SID'], ENV['AUTH'])

    @twilio_client.account.sms.messages.create(
      from: ENV['NUM'],
      to: number_to_send_to,
      body: "hello!"
    )

  end

end