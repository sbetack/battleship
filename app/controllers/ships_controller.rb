class ShipsController < ApplicationController
  def place
    @board = Board.find(place_ship_params[:board_id])
    length = place_ship_params[:ship_length].to_i
    ship = @board.ships.where("length = #{length}")[0]
    ship_spaces = Space.get_ship_spaces(@board, place_ship_params[:letter_start], place_ship_params[:number_start], place_ship_params[:direction], length)
    ship.place_ship(length, ship_spaces)
    redirect_to "deploy/board/#{board.id}"
  end

  private
  def place_ship_params
    params.permit(:letter_start, :number_start, :direction, :board_id, :ship_length)
  end
end