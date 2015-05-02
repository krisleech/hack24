class SmsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def in
    doc = Nokogiri::XML(request.body.read)

    sms = {
      message: doc.css('MessageText').text,
      number: doc.css('From').text,
      direction: 'in'
    }

    command = ProcessSms.new
    command.subscribe(SmsListener.new, async: true, prefix: 'on')
    command.call(sms)

    render text: ""
  end
end
