require './lib/cell'
require 'pry'


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

   # def num_consecutive?
   #   (placement.join.scan(/\d+/).map(&:to_i)) == [1..4]
   #
   # end




   def valid_placement?(ship, placement)
     ship_lngth = ship.length
     valid_check = placement.all? do |spot|
       valid_coordinate?(spot)
     end
      if ship_lngth == placement.length && valid_check && (horizontal_check(placement) || vertical_check(placement))
       true
      else
       false
     end
   end

  def horizontal_check(placement)
   ship_s_coord =placement.map { |coord| coord[0].ord}
   check_s_coord =ship_s_coord[0]
   ship_s_coord.all? do |coord|
     coord == check_s_coord
   end
 end

  def vertical_check(placement)
   ship_i_coord = placement.join.scan(/\d+/).map(&:to_i)
   check_i_cord = ship_i_coord[0]
   ship_i_coord.all? do |coord|
     coord == check_i_coord
   end
 end

 def coord_is_consecutive(placement)
   ship_s_coord =placement.map { |coord| coord[0].ord}
   check_s_coord =ship_s_coord[0]
   ship_i_coord = placement.join.scan(/\d+/).map(&:to_i)
   check_i_cord = ship_i_coord[0]
    



end
