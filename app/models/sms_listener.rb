class SmsListener
  def on_sms_received(sms_id)
    game = Game.current

    sms = Sms.find(sms_id)

    answer = sms.message.upcase.split(' ')

    Rails.logger.debug "[SmsListener] Answer: #{answer}"

    correct_answer = game[:answers].include?(answer)

    player = Player.find_by_number(sms.number) || Player.new(number: sms.number)

    if correct_answer
      player.points = player.points + 1
      player.save
      Rails.logger.debug "[SmsListener] Player #{player.number} got 1 point."
    else
      Rails.logger.debug "[SmsListener] Player #{player.number} got no point."
    end
  end
end
