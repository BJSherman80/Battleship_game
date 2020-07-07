class Ship

  attr_reader :name, :length, :health
  def initialize(name, length)
    @name = name
    @health = 0
    @length = {:Cruiser => 3, :Submarine => 2}
  end


  def sunk
    if @health == 0
      true
    else
      false
    end
  end

  def hit
    @health - 1
  end
