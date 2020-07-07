class Ship

  attr_reader :name, :length, :health, 
  def initialize(name, length)
    @name = name
    @length = length
    @health = ()
  end



  def health
    if name == "Cruiser"
      health = 3
    else
      health = 2
    end
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end

  def hit
    @health
  require "pry" ; binding.pry
  end

end
