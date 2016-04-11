module SMSHelper

  def send_text(shift)

    numbers_to_send_to = shift.giver.team.users.pluck(:cell)

    @twilio_client = Twilio::REST::Client.new(ENV['SID'], ENV['AUTH'])

    numbers_to_send_to.each do |number|
      @twilio_client.account.sms.messages.create(
        from: ENV['NUM'],
        to: number,
        body: "Help #{shift.giver.name}! Can you cover for them #{shift.datetime}? Reply 'yes', 'no' or 'maybe'."
      )
    end

  end

end