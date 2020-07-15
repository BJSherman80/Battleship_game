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

    board2 = Board.new
    player2 = Player.new("Batman", board2)
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)
    board1 = Board.new
    player1 = Player.new("Gandalf", board1)
    game = Game.new(player1, player2)

    assert_instance_of Game, game
  end

  def player_name_input
    board2 = Board.new
    player2 = Player.new("Batman", board2)
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)
    board1 = Board.new
    player1 = Player.new("Gandalf", board1)
    game = Game.new(player1, player2)

    refute_equal "Gandalf", game.player1.name
  end

  def test_player2_cpu_placement
    board2 = Board.new
    player2 = Player.new("Batman", board2)
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)
    board1 = Board.new
    player1 = Player.new("Gandalf", board1)
    game = Game.new(player1, player2)


    assert_equal true, game.player_2_cpu_placement
  end

  def test_player2_cpu_placement_cruiser
    skip
    game = Game.new

    assert_equal true, game.player_2_cpu_placement_cruiser
  end

  def test_player2_cpu_placement_submarine
    skip
    game = Game.new
    assert_equal true, game.player_2_cpu_placement_submarine
  end

  def test_player_1_ship_info

    game = Game.new




    assert_equal


  end

  def test_player1_can_place_ship
    skip

    game = Game.new
    # player1 = Player.new("Bob", board1)
    # player2 = Player.new()

    assert_equal "You sucessfully placed your ship!", game.player_1_placement

  end



end
