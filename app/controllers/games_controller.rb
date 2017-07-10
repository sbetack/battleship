class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def deploy_fleet
    @board = Board.find(get_params[:board_id])
  end

  private
  def get_params
    params.permit(:board_id)
  end
end