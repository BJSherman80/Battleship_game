class Cell

  attr_reader :coordinate, :empty, :ship, :render
  def initialize(coordinate)
    @coordinate = coordinate.upcase
    # @letter = coordinate[0].upcase
    # @number = coordinate[1]
    @render = "."
    @ship = nil
  end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

  def fired_upon?
    if render == "."
      false
    else
      true
    end
  end

  def fire_upon
    if empty?
      @render = "M"
    elsif ship.health > 1
      @render = "H"
      ship.hit
    else
      @render = "X"
      ship.hit
    end
  end
end
