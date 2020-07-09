require 'pry'

class Cell

  attr_reader :coordinate, :empty, :ship, :state
  def initialize(coordinate)
    @coordinate = coordinate.upcase
    @state = "."
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
    if @state == "."
      false
    else
      true
    end
  end

  def fire_upon
    if empty?
      @state = "M"
      return
    elsif ship.health > 1
      ship.hit
      @state = "H"
      return
    else
      ship.hit
      @state= "X"
      return
    end
  end

  def render(reveal_ship = false)

    if fired_upon? == false && empty? == true
      "."
    elsif reveal_ship == true && fired_upon? == false && empty? == false
      "S"
    elsif fired_upon? == true && ship.health > 1
      "H"
    elsif fired_upon? == true && ship == nil
      "M"
    else fired_upon? == true
      "X"
    end
  end

end
