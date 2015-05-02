class GamesController < ApplicationController
  def show
    render json: Game.find(params[:id]).to_json
  end
end
