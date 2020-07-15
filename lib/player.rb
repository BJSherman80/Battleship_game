require "./lib/ship"
require "./lib/cell"
require "./lib/board"

class Player

  attr_reader :name, :board
  def initialize(name, board)
    @name = name
    @board = board
  end

  def rename(new_name)
    @name = new_name
  end
end
