require_relative 'item'

class Battery < Item

  attr_reader :healing_amount

  def initialize
    super "battery", 25
    @healing_amount = 15
  end

  def repair_shield(robot)
    robot.shield_regenerate(healing_amount)
  end

end