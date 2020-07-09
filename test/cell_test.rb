"./lib/ship"
require "./lib/cell"
require "minitest/autorun"
require "minitest/pride"

class CellTest < MiniTest::Test

  def test_it_is_a_cell
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
    assert_nil(cell.ship)
  end

  def test_a_ship_can_be_added
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    assert_equal true, cell.empty?

    cell.place_ship(cruiser)

    assert_equal false, cell.empty?
  end

  def test_has_been_fired_upon
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal true, cell.fired_upon?
  end

  def test_can_be_fired_upon
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    cell.fire_upon
    
    assert_equal true, cell.fired_upon?
  end

  def test_cell_render
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    cell.fire_upon
    
    assert_equal "H", cell.render
  end

  def test_revealing_ships
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    
    assert_equal "S", cell.render(true)
  end
end
