class Ship < ApplicationRecord
  has_many :spaces
  belongs_to :board

  def self.create_fleet(board)
    fleet = []
    lengths = [2,3,3,4,5]
    lengths.each do |length|
      fleet << Ship.create(length: length, board_id: board.id, sunk: false)
    end
    fleet
  end

  def place_ship(length, ship_spaces)
    ship_spaces.each do |space| 
      space.ship = self
      space.save
    end
  end

  def self.all_ships_placed?(board)
    ships = self.where("board_id = #{board.id}")
    ships.all? { |ship| ship.spaces != [] }
  end
  
end
