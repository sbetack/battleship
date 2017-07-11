class Space < ApplicationRecord
  belongs_to :board
  belongs_to :ship, optional: true  
  
  L_TO_N = {"A": 0, 
            "B": 1,
            "C": 2,
            "D": 3,
            "E": 4,
            "F": 5,
            "G": 6,
            "H": 7,
            "I": 8,
            "J": 9
            }
  def self.coordinate_helper
  coordinates = [] 
    (0..9).to_a.each do |col_num|
      (0..9).to_a.each do |row_num|
        coordinates << "#{col_num}#{row_num}"
      end
    end
    coordinates
  end

  def self.create_spaces(board)
    status = "empty"
    coordinates = self.coordinate_helper
    coordinates.each do |coordinate|
      board.spaces << Space.create(status: status, coordinate: coordinate)
      board.save
    end
  end

  def self.get_ship_spaces(board, starting_letter, starting_number, direction, length)
    col = L_TO_N[starting_letter.to_sym]
    row = starting_number.to_i - 1
    first_space = Space.where(board_id: board.id, coordinate: "#{row}#{col}")
    spaces = [first_space]
    if direction == "up"
      (length-1).times do 
        row -= 1
        next_space = Space.where(board_id: board.id,coordinate: "#{row}#{col}")
        spaces << next_space
      end
    elsif direction == "down"
      (length-1).times do 
        row += 1
        next_space = Space.where(board_id: board.id,coordinate: "#{row}#{col}")
        spaces << next_space
      end
    elsif direction == "right"
      (length-1).times do 
        col += 1
        next_space = Space.where(board_id: board.id,coordinate: "#{row}#{col}")
        spaces << next_space
      end
    elsif direction == "left"
        (length-1).times do 
        col -= 1
        next_space = Space.where(board_id: board.id,coordinate: "#{row}#{col}")
        spaces << next_space
      end 
    end
    spaces_are_invalid = spaces.any? { |space| space == [] }
    if spaces_are_invalid
      spaces = [nil]
    else
      return spaces
    end
  end

end
