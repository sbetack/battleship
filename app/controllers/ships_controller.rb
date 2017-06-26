class ShipsController < ApplicationController
  def place
    binding.pry
    length = place_ship_params[:ship_length].to_i
    player = Player.find(place_ship_params[:player_id])
    ship = player.ships.where("length = #{length}")[0]
    ship_spaces = Space.get_ship_spaces(place_ship_params[:letter_start], place_ship_params[:number_start], place_ship_params[:direction], length)
    ship.place_ship(player, length, ship_spaces)
  end

  private
  def place_ship_params
    params.permit(:letter_start, :number_start, :direction, :player_id, :ship_length)
  end
end