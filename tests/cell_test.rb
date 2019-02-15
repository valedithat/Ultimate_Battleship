require './tests/test_helper'

class CellTest < Minitest::Test
  attr_accessor :cell

  def setup
    @cell = Cell.new('B4')
  end

  def test_new_cell
    assert_equal 'B4', cell.coordinate
    assert_equal false, cell.cell_hit
    assert_nil cell.ship
  end

  def test_place_ship
    cell.place_ship('cruiser')
    assert_equal false, cell.empty?
    assert_equal 3, cell.ship.length
  end

  def test_empty?
    assert_equal true, cell.empty?
    cell.place_ship('cruiser')
    assert_equal false, cell.empty?
  end

  def test_fire_upon
    cell.place_ship('cruiser')
    cell.fire_upon
    assert_equal true, cell.cell_hit
    assert_equal 2, cell.ship.health
  end

  def test_fired_upon?
    cell.place_ship('cruiser')
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end

  def test_render_hit
    cell.place_ship('cruiser')
    cell.fire_upon
    assert_equal "H", cell.render
  end

  def test_render_miss
    cell.fire_upon
    assert_equal "M", cell.render
  end

  def test_render_sunken_ship
    cell.ship.hit
    cell.fire_upon
    assert_equal 'X', cell.render
  end

  def test_render_empty

  end
end
