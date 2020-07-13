require "./lib/board"
require "./lib/player"
require "./lib/cell"
require "./lib/ship"
require "minitest/autorun"
require "minitest/pride"

class PlayerTest < Minitest::Test

  def test_it_is_a_player
    board1 = Board.new
    player1 = Player.new("Priscilla", board1)

    assert_instance_of Player, player1
  end

  def test_it_has_board
    board1 = Board.new
    player1 = Player.new("Priscilla", board1)

    assert_equal board1, player1.board
  end
end
