require './lib/helper'

class Board
  attr_reader :cells
  def initialize
    @cells = Hash.new
    create_cells
  end

  def create_cells
    # currently producess double a1-d4 ranges
    nums = (1..4).to_a
    letters = ('A'..'D').to_a
    letters.each do |l|
      nums.each do |n|
        coordinate = l+ n.to_s
        @cells[coordinate] = Cell.new(coordinate)
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end
end

board = Board.new
puts board.cells
# puts board.valid_coordinate?("B4")
# puts board.valid_coordinate?("D4")
# puts board.valid_coordinate?("D7")
