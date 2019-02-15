require './tests/test_helper'

class ShipTest < Minitest::Test
  attr_accessor :ship

  def setup
    @ship = Ship.new('Cruiser', 3)
  end

  def test_ship_name
    assert_equal 'Cruiser', ship.name
  end

  def test_ship_length
    assert_equal 3, ship.length
  end

  def test_ship_health
    assert_equal 3, ship.health
  end

  def test_ship_hit
    ship.hit
    assert_equal 2, ship.health
    assert_equal 3, ship.length
  end
end
