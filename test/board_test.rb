require "minitest/autorun"
require "minitest/pride"
require "./lib/board"
require './lib/ship'

class BoardTest < Minitest::Test
  def test_it_is_a_board
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_can_generate_cells
    board = Board.new

    assert_equal 16, board.cells.count
  end

  def test_ships_cant_be_placed_off_board
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_cell_placement_matches_ship_lengths
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal true, board.valid_placement?(submarine, ["B2", "B3"])
  end

  def test_placement_is_consecutive
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal true, board.valid_placement?(cruiser, ["A2", "A3", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal true, board.valid_placement?(submarine, ["A1", "B1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_coords_cant_be_diagonal
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_valid_placement
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
  end

  def test_placing_ships
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal cell_3.ship, cell_2.ship
  end

  def test_ships_dont_overlap
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    board.place(cruiser, ["A1", "A2", "A3"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
    assert_equal true, board.valid_placement?(submarine, ["B1", "B2"])
  end

  def test_render
    skip
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    board.place(cruiser, ["A1", "A2", "A3"]

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render
    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", board.render(true)
  end

  def test_random_placement_up
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    test_placement = board.random_placement(cruiser, "up", "C3")

    assert_equal ["C3", "B3", "A3"], test_placement
  end

  def test_random_placement_down
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    test_placement = board.random_placement(cruiser, "down", "A4")

    assert_equal ["A4", "B4", "C4"], test_placement
  end

  def test_random_placement_left
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    test_placement = board.random_placement(cruiser, "left", "B3")

    assert_equal ["B3", "B2", "B1"], test_placement
  end

  def test_random_placement_right
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    test_placement = board.random_placement(cruiser, "right", "A4")

    assert_equal ["A4", "A5", "A6"], test_placement
  end
end
