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
    columns = ["1", "2", "3", "4"]
    rows.each do |row|
      columns.each do |column|
        coordinate = "#{row}#{column}"
        @cells[coordinate] = Cell.new(coordinate)
      end
    end
  end

  def render_row(row_letter, show_all)
    row = "#{row_letter}"
    cells_for_row = cells.values.find_all do |cell|
      cell.coordinate[0] == row_letter
    end
    cells_for_row.each do |cell|
      row += " " + cell.render(show_all)
    end
    row
  end

  def render(show_all = false)
    rows = ["  1 2 3 4"]
    ["A", "B", "C", "D"].map do |row_letter|
    rows << render_row(row_letter, show_all)
    end
    renderable_rows = ""
    rows.map do |row|
      renderable_rows += row.to_s.concat(" \n")
    end
    p renderable_rows
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
    end
  end

  def valid_coordinate?(coord)
    cells.one? do |coordinate, cell|
      cell.coordinate == coord
    end
  end

  def empty_spot?(placement)
    placement.all? do |coord|
      cells[coord].empty?
    end
  end

  def valid_placement?(ship, placement)
    spot_check = placement.all? do |spot|
      valid_coordinate?(spot)
    end
    if (ship.length == placement.length) && (spot_check == true) && empty_spot?(placement)
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

  def random_coordinate
    cells.keys.sample
  end

  def random_direction
    direction = ["up", "down", "left", "right"].sample
  end

  def random_placement(ship, direction, first_coordinate)
    letter = first_coordinate[0]
    number = first_coordinate[1]
    placement = [first_coordinate]

    until placement.length == ship.length
      next_one = next_coord(first_coordinate, direction)
      placement << next_one
      first_coordinate = next_one
    end
    return placement
  end

  def next_coord(first_coordinate, direction)
    letter = first_coordinate[0]
    number = first_coordinate[1]

    case direction
    when "up"
      (letter.ord - 1).chr + number
    when "down"
      (letter.ord + 1).chr + number
    when "left"
      letter + (number.to_i - 1).to_s
    when "right"
      letter + (number.to_i + 1).to_s
    end
  end
end
