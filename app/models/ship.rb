class Ship < ApplicationRecord
  has_many :spaces
  belongs_to :player

  def self.create_fleet(player)
    fleet = []
    lengths = [2,3,3,4,5]
    lengths.each do |length|
      fleet << Ship.create(length: length, player: player, sunk: false)
    end
    fleet
  end

  def place_ship(player, length, ship_spaces)
    ship_spaces.each do |space| 
      space.ship = self 
      space.save
    end
  end
  
end
