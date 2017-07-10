class Player < ApplicationRecord
  has_many :boards
  has_many :games, through: :boards
  has_one :board
  has_many :ships
  
end
