require './lib/helper'

class Board
  attr_reader :cells

  include ValidationHelper

  def initialize
    @cells = Hash.new
    create_cells
  end

  def create_cells
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

  def valid_placement?(ship, coordinates)
    # length of coordinates == Ship.new.length
    check_ship_length(ship, coordinates.length)
    # cell in cells is found in @cells
    check_coordinates_in_range(coordinates)
    # consequtive
    check_consequtive_coordinates(coordinates)
    # coordinates not diagonal
  end
end
