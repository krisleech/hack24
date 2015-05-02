class CardsController < ApplicationController

  # GET /games/3/cards
  def index
    game = Game.find(params[:game_id])

    smses = Sms.where(processed: false, direction: 'in')

    response = []

    smses.each do |sms|
      answer = sms.message.upcase.split(' ')
      logger.debug "[show] #{answer}"

      if answer_valid?(answer)
        logger.debug "[show] Valid answer, adding to response: #{answer}"

        correct_answer = game[:answers].include?(answer)

        item = { card_1: answer[0],
                 card_2: answer[1],
                 match: correct_answer }

        unless response.find { |i| i[:card_1] == answer[0] && i[:card_2] == answer[1] }
          response << item
        end
      else
        Rails.logger.debug "[show] Invalid answer: #{answer}"
      end

      # sms.processed!
    end


    render json: response.to_json
  end

  private

  def answer_valid?(answer)
    grid_positions.include?(answer[0]) && grid_positions.include?(answer[1])
  end

  def grid_positions
    (1..11).to_a.map(&:to_s)
  end
end
