require "./lib/ship"
require "./lib/cell"
require "minitest/autorun"
require "minitest/pride"
require './lib/game'

class GameTest < MiniTest::Test

  def test_player2_cpu_placement_cruiser
    game1 = Game.new

    assert_equal true, game1.player_2_cpu_placement_cruiser
  end

  # def test_player2_cpu_placement_submarine
  #   game1 = Game.new
  #   assert_equal true, game1.player_2_cpu_placement_submarine
  # end
  #
  # def test_player1_can_place_ship
  #   game1 = Game.new
  #
  #   assert_equal "You sucessfully placed your ship!", game1.player_1_placement
  # end

end
