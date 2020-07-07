require "./lib/ship"
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
    assert_equal nil, cell.ship
  end

  def test_is_cell_occupied
    cell = Cell.new("B4")

    assert_equal true, cell.empty?

    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.empty?
  end

  def test_a_ship_can_be_added
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    assert_equal true, cell.empty?

    cell.place_ship(cruiser)

    assert_equal false, cell.empty?
  end

  def test_fire_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)


  def test_it_can_render
    skip
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    # render can check if cell is empty
    # if false, run ship.hit and return "H"
    # if true, returns "M"
    # render's RVs: H (hit), M (miss), . (fired upon), X (sunk_)
    # render will also replace H's


  end
end
