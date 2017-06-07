class Board < ApplicationRecord
  has_many :spaces
  belongs_to :player
end
