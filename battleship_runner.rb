require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"

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

cpu_names = ["Brittany", "Jonas", "Morty", "Gandhi", "Batman", "The Final Pam"].sample

player2 = Player.new(cpu_names, board2)
board2 = Board.new

p "Please input your name! "

player_name = gets.chomp.capitalize

player1 = Player.new(player_name, board1)
board1 = Board.new

p2_placement_1 = player2.board.cells.values.sample

if p2_placement_1.
