require "./lib/ship"
require "./lib/cell"
require './lib/game'
require "./lib/player"
require "./lib/board"
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"

class GameTest < MiniTest::Test

  def test_it_is_a_game
    game = Game.new
    board2 = Board.new
    player2 = Player.new("Brittany", board2)
    board1 = Board.new
    player1 = Player.new("Bob", board1)
    assert_instance_of Game, game
  end

  def test_player2_cpu_placement
    skip
    game = Game.new(player1, player2)
    board2 = Board.new
    player2 = Player.new("Brittany", board2)
    board1 = Board.new
    player1 = Player.new("Bob", board1)

    assert_equal true, game.player_2_cpu_placement
  end

  def test_player2_cpu_placement_cruiser
    game1 = Game.new(player1, player2)
    board2 = Board.new
    player2 = Player.new("Brittany", board2)
    board1 = Board.new
    player1 = Player.new("Bob", board1)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)


    assert_equal true, game1.player_2_cpu_placement_cruiser
  end

  def test_player2_cpu_placement_submarine
    skip
    game1 = Game.new(player1, player2)
    assert_equal true, game1.player_2_cpu_placement_submarine
  end

  def test_player_1_ship_info
    game1 = Game.new(player1, player2)
    board2 = Board.new
    player2 = Player.new("Brittany", board2)
    board1 = Board.new
    player1 = Player.new("Bob", board1)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

  end

  def test_player1_can_place_ship

    game1 = Game.new(player1, player2)
    # player1 = Player.new("Bob", board1)
    # player2 = Player.new()

    assert_equal "You sucessfully placed your ship!", game1.player_1_placement

  end



end
