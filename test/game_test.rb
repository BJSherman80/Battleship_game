require "./lib/ship"
require "./lib/cell"
require "minitest/autorun"
require "minitest/pride"

class GameTest < MiniTest::Test

  def test_player1_can_place_ship
    board1 = Board.new
    player1 = Player.new("Brett", board1)
    p1_placement = ("Cruiser", "A3")

    assert_equal("You sucessfully placed your ship!"), battleship_runner.p1_placement
  end
