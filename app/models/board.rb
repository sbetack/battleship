class Board < ApplicationRecord
  has_many :spaces
  belongs_to :player

  def self.generate_player_game(player)
    board = Board.create(player: player)
    Ship.create_fleet(player)
    Space.create_spaces(board)
  end
end
