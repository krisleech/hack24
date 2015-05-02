class PlayerListener
  def on_sms_received(sms_id)
    game = Game.current

    sms = Sms.find(sms_id)

    answer = sms.message.split(' ')

    unless answer.size == 2
      player = Player.find_by_number(sms.number)
      player.update_attribute(:name, sms.message)
      Rails.logger.debug("Setting player #{player.number} name to #{player.name}")
    end
  end
end
