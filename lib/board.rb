require './lib/cell'
require './lib/ship'
require 'pry'

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
    rows.join("\n")
    puts rows
  end


  # def render
  #   row_a = ["A", ".", ".", ".", "."]
  #   row_b = ["B", ".", ".", ".", "."]
  #   row_c = ["C", ".", ".", ".", "."]
  #   row_d = ["D", ".", ".", ".", "."]
  #   p "  1 2 3 4 \n" +row_a+ "\n" +row_b+ "\n" +row_c+ "\n" +row_d+ "\n"
  # end

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
end







# render =
#   "  1 2 3 4 "
#   + "\n"
#   + "A "
#   + A row cell render
#   + "\n"
#   + "B "
#   + B row cell render
#   + "C "
#   + C row cell render
#   + "D "
#   + D row cell render
#
# render =
# header row
# + each row
#
# each row = letter + iterate through each cell of that row
 #
 #  def horizontal_check(placement)
 #   ship_s_coord =placement.map { |coord| coord[0].ord}
 #   check_s_coord =ship_s_coord[0]
 #   ship_s_coord.all? do |coord|
 #     coord == check_s_coord
 #   end
 # end
 #
 #  def vertical_check(placement)
 #   ship_i_coord = placement.join.scan(/\d+/).map(&:to_i)
 #   check_i_cord = ship_i_coord[0]
 #   ship_i_coord.all? do |coord|
 #     coord == check_i_coord
 #   end
 # end
 #
 # def coord_is_consecutive(placement)
 #   ship_s_coord =placement.map { |coord| coord[0].ord}
 #   check_s_coord =ship_s_coord[0]
 #   ship_i_coord = placement.join.scan(/\d+/).map(&:to_i)
 #   check_i_cord = ship_i_coord[0]
