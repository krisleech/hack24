class Answer
  def initialize(answer)
    @answer = answer.split(' ')
  end

  def card_1
    @answer[0]
  end

  def card_2
    @answer[1]
  end

  def to_a
    [card1, card_2]
  end

  def valid?
    valid_cards.include?(card_1) && valid_cards.include?(card_2)
  rescue
    false
  end

  private

  def valid_cards
    @valid_cards ||= (1..12).map(&:to_s)
  end
end

