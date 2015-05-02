class PlayersController < ApplicationController
  def index
    render json: Player.all.to_json
  end
end
