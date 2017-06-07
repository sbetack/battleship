class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players
  has_one :winner, class_name: :Player, foreign_key: :winner_id

end
