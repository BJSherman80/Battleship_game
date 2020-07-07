require "./lib/ship"
require "minitest/autorun"
require "minitest/pride"

class ShipTest < MiniTest::Test

  def test_it_is_a_ship
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, ship
  end

  def test_it_has_attributes
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
    assert_equal 3, cruiser.length
    assert_equal 3, cruiser.health
  end

  def test_it_can_take_damage
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    assert_equal 2, cruiser.health
  end

  def test_it_can_sink
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit

    assert_equal false, cruiser.sunk?

    cruiser.hit

    assert_equal true, cruiser.sunk?
  end
end
