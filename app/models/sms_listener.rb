class SmsListener
  def on_sms_received(sms_id)
    sms = Sms.find(sms_id)

    # send 

    Rails.logger.debug sms.inspect
  end
end
