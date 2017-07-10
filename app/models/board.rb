class Board < ApplicationRecord
  belongs_to :game, counter_cache: :player_count
  belongs_to :player
  has_many :ships
  has_many :spaces

  def generate_player_game
    Ship.create_fleet(self)
    Space.create_spaces(self)
  end
end
