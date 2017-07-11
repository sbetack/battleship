class ShipsController < ApplicationController
  def place
    p params
    @board = Board.find(place_ship_params[:board_id])
    p @board
    length = place_ship_params[:ship_length].to_i
    ship = @board.ships.where("length = #{length}")[0]
    p ship
    ship_spaces = Space.get_ship_spaces(@board, place_ship_params[:letter_start], place_ship_params[:number_start], place_ship_params[:direction], length)
    # ship.place_ship(length, ship_spaces)
    ship_spaces.each do |space|
      ship.spaces << space[0]
      p space
      space[0].status = 'ship'
      space[0].save
      p space[0]
    end
    redirect_back(fallback_location: "deploy/board/#{@board.id}") 
  end

  private
  def place_ship_params
    params.permit(:letter_start, :number_start, :direction, :board_id, :ship_length)
  end
end