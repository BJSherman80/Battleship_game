require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"

board2 = Board.new
player2 = Player.new("Batman", board2)
cruiser = Ship.new("cruiser", 3)
submarine = Ship.new("submarine", 2)
board1 = Board.new
player1 = Player.new("Gandalf", board1)

class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    p1_setup
  end

  def p1_setup
    puts "Please input your name. "
    player1_name = gets.chomp.capitalize
    @player1.rename(player1_name)
  end

  def play_game
    intro_to_game
    player_2_cpu_placement
    taunt
    player_1_placement
    gameplay
  end

  def intro_to_game
    p "Welcome to Battleship!"
    p "Enter p to play. Enter q to quit. "
    start = gets.chomp

    loop do
      if start == "p"
        break
      elsif start == "q"
        exit
      end
    end
  end

  def player_2_cpu_placement
    cpu_cruiser_placement
    cpu_sub_placement
  end

  def cpu_cruiser_placement
    cruiser = Ship.new("cruiser", 3)
    check = false
    until check == true
      cpu_coordinate = @player2.board.random_coordinate
      cpu_direction = @player2.board.random_direction
      placement_attempt = @player2.board.random_placement(cruiser, cpu_direction, cpu_coordinate)
      check = @player2.board.valid_placement?(cruiser, placement_attempt)
    end
    @player2.board.place(cruiser, placement_attempt)
    check

  end

  def cpu_sub_placement
    submarine = Ship.new("submarine", 2)
    check = false
    until check == true
      cpu_coordinate = @player2.board.random_coordinate
      cpu_direction = @player2.board.random_direction
      placement_attempt = @player2.board.random_placement(submarine, cpu_direction, cpu_coordinate)
      check = @player2.board.valid_placement?(submarine, placement_attempt)
    end

    player2.board.place(submarine, placement_attempt)
    check
  end

  def taunt
    p "I have laid out my ships on the grid. \nYou now need to lay out your ships. \nThe Cruiser is three units long and the Submarine is two units long."
  end


  def player_1_placement_instructions
    p "Please place your ship. The formatting should fit the length of your ship. For example, a cruiser has a length of 3 units and should be placed on three coordinates. Please enter the ship, then those coordinates one at a time below:"
  end

  def player_1_ship_information
    submarine = Ship.new("submarine", 2)
    cruiser = Ship.new("cruiser", 3)
    p1_ship_choice = gets.chomp.downcase
    if p1_ship_choice == "cruiser"
      p1_ship_choice = cruiser
    elsif p1_ship_choice == "submarine"
      p1_ship_choice = submarine
    end

    ship_spot_1 = gets.chomp
    ship_spot_2 = gets.chomp
    p1_placement = []
    case p1_ship_choice.length
    when 2
      p1_placement << ship_spot_1 << ship_spot_2
    when 3
      ship_spot_3 = gets.chomp
      p1_placement << ship_spot_1 << ship_spot_2 << ship_spot_3
    end
    [p1_ship_choice, p1_placement]
  end

  def player_1_placement
    player_1_placement_instructions
    2.times do
      player_1_ship_information
      loop do
        if player1.board.valid_placement?(p1_ship_choice, p1_placement)
          player1.board.place(p1_ship_choice, p1_placement)
          "You sucessfully placed your ship!"
          exit
        else
          "That was an invalid ship or coordinate, please re-enter a valid ship and coordinate."
        end
      end
    end
  end

  def gameplay
    loop do
      p "Player 1 board:"
      player1.board.render(true)
      p "-" * 15
      p "Player 2 board:"
      player2.board.render
      p "-" * 15
      player_1_turn
      player2.board.render
      player_2_turn
      until
        win_condition == true
      end
    end
  end

  def player_1_turn
    fire = gets.chomp

    if player2.board.cells[fire].fired_upon? == false
      player2.board.cells[fire].fire_upon
        if player2.board.cells[fire].state == "H"
          p "Your shot on #{fire} was a hit"
        elsif player2.board.cells[fire].state == "M"
          p "your shot on #{fire} was a miss"
        elsif player2.board.cells[fire].state == "X"
          p "You sunk their ship!"
        end
    elsif
      player_1_turn
    end
  end


  def player_2_turn
    attack = "A1"
    until player1.board.cells[attack].fired_upon? == false
    attack = player2.board.random_coordinate
    end
    cell_to_attack = player1.board.cells[attack]
    cell_to_attack.fire_upon
    p "I have made my move."
  end

  def win_calculations
    p1lose = player1.board.cells.values.find_all do |p1calc|
      p1calc.state = X
    end

    p2lose = player2.board.cells.values.find_all do |p2calc|
      p2calc.state = X
    end

    if p1lose.count == 5
      winner = @player2.name
    elsif p2lose.count == 5
      winner = @player1.name
    else
      false
    end
  end

  def win_condition

    case win_calculations
    when win_calculations == false
      break
    when win_calculations == true
      p "Congrats for winning the game, #{winner}!"
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
