require './lib/cell'
require './lib/ship'


class Board
  attr_reader :cells
  def initialize
    @cells = {}
    generate_cells
  end

  def generate_cells
    rows = ["A", "B", "C", "D"]
    columns =["1", "2", "3", "4"]
    rows.each do |row|
      columns.each do |column|
        coordinate = "#{row}#{column}"
        @cells[coordinate] = Cell.new(coordinate)
      end
    end
  end

  def orientation_check(placement)
    place_letters = []
    place_numbers = []
    placement.each do |place|
      place_letters << place[0]
      place_numbers << place[1].to_i
    end
    comparing_letters = place_letters & ("A".."D").to_a
    comparing_numbers = place_numbers & (1..4).to_a
    if (comparing_letters.count >= 2) && (comparing_numbers.count >= 2)
      false
    elsif (comparing_letters.count >= 2) && (comparing_numbers.count == 1)
      (comparing_letters.first..comparing_letters.last).to_a == comparing_letters
    elsif (comparing_numbers.count >= 2) && (comparing_letters.count == 1)
      (comparing_numbers.first..comparing_numbers.last).to_a == comparing_numbers
    else
    end
  end

  def valid_coordinate?(coord)
    cells.one? do |coordinate, cell|
      cell.coordinate == coord
    end
  end

  def valid_placement?(ship, placement)
    spot_check = placement.all? do |spot|
      valid_coordinate?(spot)
    end
    if (ship.length == placement.length) && (spot_check == true)
      orientation_check(placement)
    else
      false
    end
  end

  def place(ship, placement)
    if valid_placement?(ship, placement)
      placement.each do |shipping|
        @cells[shipping].place_ship(ship)
      end
    end
  end

  def render(arg = false)
    if arg = false
      @cells.keys.each
    elsif arg = true
    end
  end
end
