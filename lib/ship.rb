require './lib/helper'

class Ship
  attr_accessor :name, :length, :health
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def hit
    @health -= 1
  end

  def sunk?
    health.zero?
  end
end
