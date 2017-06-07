class Space < ApplicationRecord
  belongs_to :board
  belongs_to :ship, optional: true

  def self.create_spaces(board)
    status = "empty"
    coordinates = self.coordinate_helper
    coordinates.each do |coordinate|
      board.spaces << Space.create(status: status, coordinate: coordinate)
      board.save
    end
  end
end
