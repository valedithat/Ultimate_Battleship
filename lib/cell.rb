require './lib/helper'

class Cell
  attr_reader :coordinate, :ship, :cell_hit, :status
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_hit = false
    @status = '.'
  end

  def place_ship(name)
    # written already? wheres check? could refactor
    if name == 'cruiser'
      length = 3
    elsif name == 'submarine'
      length = 2
    end
    @status = 'S'
    @ship = Ship.new(name, length)
  end

  def empty?
    @ship.nil?
  end

  def fire_upon
    if @ship.nil?
      @status = 'M'
    else
      @ship.hit
      if @ship.sunk?
        @status = 'X'
      else
        @status = 'H'
      end
      @cell_hit = true
    end
  end

  def fired_upon?
    @cell_hit
  end

  def render
    @status
  end
end
