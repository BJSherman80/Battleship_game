require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"

class Game

  def initialize
    intro_to_game
    player_2_cpu_placement
    player_1_placement

  end

  cpu_names = ["Brittany", "Jonas", "Morty", "Gandhi", "Batman", "The Final Pam"].sample
  board2 = Board.new
  player2 = Player.new(cpu_names, board2)
  player_name = gets.chomp.capitalize
  board1 = Board.new
  player1 = Player.new(player_name, board1)
  cruiser = Ship.new("cruiser", 3)
  submarine = Ship.new("submarine", 2)

  def intro_to_game
    p "Welcome to Battleship!"
    p "Enter p to play. Enter q to quit. "
    a = gets.chomp

    loop do
      if a == "p"
        break
      elsif a == "q"
        exit
      end
    end
  end

  def player_2_cpu_placement_cruiser
    loop do
      cpu_coordinate = player2.board.random_coordinate
      cpu_direction = player2.board.random_direction
      placement_attempt = player2.board.random_placement(cruiser, cpu_direction, cpu_coordinate)
      check = player2.board.valid_placement?(cruiser, placement_attempt)
      until
        check == true
      end
    end
  end

  def player_2_cpu_placemenmt_submarine
    player2.board.place(cruiser, placement_attempt)
    loop do
      cpu_coordinate = player2.board.random_coordinate
      cpu_direction = player2.board.random_direction
      placement_attempt = player2.board.random_placement(submarine, cpu_direction, cpu_coordinate)
      check = player2.board.valid_placement?(submarine, random_placement)
      until
        check == true
      end
    end

    p "I have laid out my ships on the grid. \nYou now need to lay out your ships. \nThe Cruiser is three units long and the Submarine is two units long."
  end


  def player_1_placement
    p1_placement = gets.chomp
    loop do
      if player1.board.valid_placement?(p1_placement)
        player1.board.place(p1_placement)
        p "You sucessfully placed your ship!"
        exit
      else
        "That was an invalid ship or coordinate, please re-enter a valid ship and coordinate."
      end
    end
  end

end

# Methods =
# Ship:
#  sunk? - checks if health is 0
#  hit - does damage to ship
# Cell:
#  empty? - checks if cell is empty
#  place_ship(ship_object) - changes ship attribute to include ship_object
#  fired_upon? - checks if fired upon or not
#  fire_upon - determines miss/hit/sink
#  render(argument passed on by board) - renders the cell
# Board:
#  orientation_check(placement) - checks placement of ship based on array of cells
#  place(ship, placement) - places ship and checks to see if it's valid
# Player:
#  none
