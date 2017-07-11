class ShipsController < ApplicationController
  def place
    @board = Board.find(place_ship_params[:board_id])
    length = place_ship_params[:ship_length].to_i
    ship = @board.ships.where("length = #{length}")[0]
    if Ship.all_ships_placed?(@board)
      redirect_to('/play')
    else
      if !ship
        flash[:select_ship] = "Please select a ship!"
      elsif ship.spaces != []
        ship = @board.ships.where("length = #{length}")[1]
        ship_spaces = Space.get_ship_spaces(@board, place_ship_params[:letter_start], place_ship_params[:number_start], place_ship_params[:direction], length)
        if ship_spaces.length == ship.length
          ship_spaces.each do |space|
            ship.spaces << space[0]
            space[0].status = 'ship'
            space[0].save
          end
        else
          flash[:invalid_location] = "INVALID CHOICE. SHIP WOULD BE OUT OF BOUNDS."
        end
      else
        ship_spaces = Space.get_ship_spaces(@board, place_ship_params[:letter_start], place_ship_params[:number_start], place_ship_params[:direction], length)
        if ship_spaces.length == ship.length
          ship_spaces
          ship_spaces.each do |space|
            ship.spaces << space[0]
            space[0].status = 'ship'
            space[0].save
          end
        else 
          flash[:invalid_location] = "INVALID CHOICE! SHIP WOULD BE OUT OF BOUNDS!"
        end
      end
      redirect_back(fallback_location: "deploy/board/#{@board.id}") 
    end
  end

  private
  def place_ship_params
    params.permit(:letter_start, :number_start, :direction, :board_id, :ship_length)
  end
end