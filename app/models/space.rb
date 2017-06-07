class Space < ApplicationRecord
  belongs_to :board
  belongs_to :ship, optional: true
end
