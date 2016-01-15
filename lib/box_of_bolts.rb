require_relative 'item'

class BoxOfBolts < Item

  attr_reader :healing_amount

  def initialize
    @name = "Box of bolts"
    @weight = 25
    @healing_amount = 20
  end

  def feed(robot)
    robot.heal(healing_amount)
  end

end