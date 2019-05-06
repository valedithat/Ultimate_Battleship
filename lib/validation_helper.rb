require './lib/helper'

module ValidationHelper
  def check_ship_length(ship, length)
    return length == ship.length
  end

  def check_coordinates_in_range(coordinates)
    return coordinates.all? { |coordinate| @cells.member?(coordinate) }
  end

  def check_consequtive_coordinates(coordinates)
    length  = coordinates.length
    letters = coordinates.map { |coord| coord[0]}
    numbers = coordinates.map { |coord| coord[1]}

    consequtive_letters = validate_consequtiveness(letters, length) if letters.any? { |l| l != letters[0] }
    consequtive_numbers = validate_consequtiveness(numbers, length) if numbers.any? { |n| n != numbers[0] }

    return true if consequtive_numbers || consequtive_letters
  end

  def validate_consequtiveness(array, length)
    binding.pry
    # array.each_cons(length).all? { |a, b| b == a + 1 }
  end
end
