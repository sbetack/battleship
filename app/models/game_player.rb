class GamePlayer < ApplicationRecord
  belongs_to :game, counter_cache: :player_count
  belongs_to :player
end
