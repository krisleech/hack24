class ProcessSms
  include Wisper.publisher

  def self.call(sms)
    new(sms).call
  end

  def call(sms)
    sms = Sms.create!(sms)
    broadcast(:sms_received, sms.id)
    self
  end
end
