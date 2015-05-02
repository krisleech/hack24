class Game

  Grid = [{ title: 'Pirates of the Caribbean',     grid_pos: '1', poster: '786362_ori-pirates-of-the-caribbean.jpg' },
          { title: 'The Devils Advocate',          grid_pos: '2', poster: '830796_ori-the-devils-advocate.jpg' },
          { title: 'Slumdog Millionaire',          grid_pos: '3', poster: '10864783_ori-slumdog-millionaire.jpg' },
          { title: 'Invictusa',                    grid_pos: '4', poster: '10922777_ori-invictusa.jpg' },
          { title: 'Around the world in 80 days',  grid_pos: '5', poster: '11148613_ori-around-the-world-in-80-days.jpg' },
          { title: 'Speed',                        grid_pos: '6', poster: '11164772_ori-speed.jpg' },
          { title: 'Titanic',                      grid_pos: '7', poster: '11166320_ori-titanic.jpg' },
          { title: 'Lord of the rings',            grid_pos: '8', poster: '11166423_ori-lord-of-the-rings.jpg' },
          { title: 'Million dollar baby',          grid_pos: '9', poster: '11168106_ori-million-dollar-baby.jpg' },
          { title: 'Grand Torino',                 grid_pos: '10', poster: '11170029_ori-gran-torino.jpg' },
          { title: 'Penguins of Madagasca',        grid_pos: '11', poster: '11179636_ori-penguins-of-madagasca.jpg' },
          { title: 'Night of Museum',              grid_pos: '12', poster: '11181399_ori-night-at-the-museum.jpg' }]

  Games = [
    { id: 1, grid: Grid, question: "Which two films have won more than 10 oscars?",       answers: [["7", "8"]] },
    { id: 2, grid: Grid, question: "Which two films star Keanu Reeves?",                  answers: [["6", "2"]] },
    { id: 3, grid: Grid, question: "Which two films contain the same word in the title?", answers: [["3", "9"]] },
    { id: 4, grid: Grid, question: "Which two films are directed by Clint Eastwood?",     answers: [["4", "10"]] },
    { id: 5, grid: Grid, question: "Which two films were created by Disney?",             answers: [["1", "5"]] }
  ]

  def self.find(id)
    self.current_id = id
    Games.find { |game| game[:id] == id.to_i }
  end

  def self.current
    Rails.logger.debug "Current Game: #{current_id}"
    find(current_id)
  end

  def self.current_id
    @current_id
  end

  def self.current_id=(id)
    @current_id = id
  end
end
