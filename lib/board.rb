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

  def valid_coordinate?(coord)
    cells.one? do |coordinate, cell|
      cell.coordinate == coord
    end
  end

  def valid_placement?(ship, placement)
    num = ship.length
    spot_check = placement.all? do |spot|
      valid_coordinate?(spot)
    end
    if (num == placement.length) && (spot_check == true)
      placement.each_cons(num) { |place| (place.ord == (65) && (place.to_i == [1..4])) || (place.ord[65..68])} #49-52
    else
      false
    end
  end

end
