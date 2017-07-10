class Game < ApplicationRecord
  has_many :boards
  has_many :players, through: :boards
  has_one :winner, class_name: :Player, foreign_key: :winner_id
  def self.open_games
    games = self.all
    game.players 
  end
end
