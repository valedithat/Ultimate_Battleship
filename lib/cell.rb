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
    if name == 'cruiser'
      length = 3
    elsif name == 'submarine'
      length = 2
    end
    @status = 'S'
    # possible problems with below:
    # Each cell creates a new Ship object and thus will grant it twice the health/fireability
    # Additionally between cells you can't track ship health between cells. Firing one on
    # one cell (on a sub ship) and once on another cell (with sub ship) will result in
    # a health score of 1 each not a sunken ship.


    # maybe board is a module thats inheritted by cell. Board keeps track of Ship object
    # Board.does initialize possible ships, then executes setup - by doing the cell.place_ship(cruiser), and that takes the already existing cruiser = Ship.new('Cruiser', 3) and assignes a length to the cell,
    # before validation:
      # cell.empty? for each input
      # from start cell, next is to left, to right, above, below?
      # oorr
      # ship all in same letter row?
      # ship all in same num column?
      # n+1 or n-1?
      # !4,1,2 or !DAB
    @ship = Ship.new(name, length)
          # if that was the case place_ship() would look like:
          # @ship = name -> name being whats passed in and maybe you could take out
          # @ship = nil from initialize
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
