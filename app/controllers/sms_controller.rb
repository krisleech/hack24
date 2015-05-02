class SmsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def in
    doc = Nokogiri::XML(request.body.read)

    sms = {
      message: doc.css('MessageText').text,
      number: doc.css('From').text,
      direction: 'in'
    }

    Sms.create(sms)

    # TODO: do something

    Rails.logger.debug sms.inspect
    render text: ""
  end
end
