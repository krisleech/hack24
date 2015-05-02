class GamesController < ApplicationController
  Answers = [
    ["A1", "B2"],
    ["A2", "B2"],
    ["A3", "B2"],
    ["A4", "B2"],
    ["A5", "B2"],
    ["A6", "B2"]
  ]

  Grid = [{ title: 'Terminator', image: 'hello', grid_pos: 'A1' }, 
          { title: 'Terminator', image: 'hello', grid_pos: 'A1' },
          { title: 'The sound of music', image: 'hello', grid_pos: 'A2' }]

  # send initial grid
  def new
    render json: Grid.to_json
  end

  # say which cards need to be flipped or shown
  def show

    # get all inbound sms which have not been processed
    smses = Sms.where(processed: false, direction: 'in')

    response = []

    smses.each do |sms|
      answer = sms.message.upcase.split(' ')

      correct_answer = Answers.include?(answer)

      # the ones which have an answer get points
      # could be moved to a diff proccess
      if correct_answer
        player = Player.find_or_create(number: sms.number)
        player.points = player.points + 1
        player.save
      end

      # build list of json for every sms inbound and if they are a answer or not
      response << { card_1: answer[0],
                    card_2: answer[1],
                    match: correct_answer }

      sms.processed!
    end


    render json: response.to_json
  end
end
