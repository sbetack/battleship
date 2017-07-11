class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def deploy_fleet
    @board = Board.find(get_params[:board_id])
    @ships = @board.ships.order(length: :desc)
  end

  def play
    @game = Game.find(get_params[:game_id])
  end


  private
  def get_params
    params.permit(:board_id, :game_id)
  end
end