require './lib/cell'
require 'pry'

class Board
  attr_reader :cells
  def initialize
    @cells = {}
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


end
