class Player < ApplicationRecord
  has_many :game_players
  has_many :games, through: :game_players
  has_one :board
  has_many :ships
  
end
