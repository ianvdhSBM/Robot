require_relative 'weapon'

class Grenade < Weapon

  attr_accessor :range

  def initialize
    super "Grenade", 40, 15
    @range = 2
  end

end