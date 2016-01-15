require_relative 'item'
require_relative 'error'
require 'pry'

class Robot

  attr_reader :items, :max_shield

  attr_accessor :equipped_weapon, :health, :shield_points, :position

  def initialize
    @health = 100
    @position = [0, 0]
    @items = []
    @equipped_weapon = nil
    @shield_points = 50
    @max_shield = 50
  end

  def self.all_robots
    ObjectSpace.each_object(self).to_a
  end

  def self.in_position(x, y)
    checked_position = [x, y]

    robot_array = ObjectSpace.each_object(self).to_a

    list =  robot_array.select do |ele|
              ele.position == checked_position
            end
  end

  def scan
    robot_array = Robot.all_robots

    new_list = robot_array.select do |ele|
            # enemy 1 space above
             ele.position[1] - position[1] == 1 ||
            # enemy 1 space below
             position[1] - ele.position[1] == 1 ||
            # enemy 1 space right
             ele.position[0] - position[0] == 1 ||
            # enemy 1 space left
             position[0] - ele.position[0] == 1
           end
    new_list
  end


  def move_left
    position[0] -= 1
  end

  def move_right
    position[0] += 1
  end

  def move_up
    position[1] += 1
  end

  def move_down
    position[1] -= 1
  end

  def pick_up(item)
    if items_weight >= 250
      false
    elsif item.is_a?(BoxOfBolts) && health <= 80
      item.feed(self)
    else
      if item.is_a?(Weapon)
        @equipped_weapon = item
      end
      @items << item
    end
  end

  def items_weight
    weight = 0
    items.each do |item|
      weight += item.weight
    end
    weight
  end

  def wound(dmg)
    if dmg > shield_points
      @health -= dmg - shield_points
      @shield_points = 0
    elsif dmg < shield_points
      @shield_points -= dmg
    elsif dmg > @health
      @health = 0
    else
      @health -= dmg
    end
  end

  def heal(regen)
    if health + regen > 100
      health = 100
    else 
      @health += regen
    end
  end

  def shield_regenerate(regen)
    if shield_points + regen > 50
      shield_points = 50
    else 
      @shield_points += regen
    end
  end

  def heal!(regen)
    if health <= 0
      raise NoHealError
    elsif health + regen > 100
      health = 100
    else
      health += regen
    end
  end

  def attack(enemy)
    unless equipped_weapon.nil?
      if enemy_in_range?(enemy, equipped_weapon.range)
        equipped_weapon.hit(enemy)
        @equipped_weapon = nil if equipped_weapon.is_a?(Grenade)
      end
    else
      enemy.wound(5) if enemy_in_range?(enemy, 1)
    end
  end

  def attack!(enemy)
    if enemy.is_a?(Robot)
      if equipped_weapon.nil?
        enemy.wound(5)
      else
        @equipped_weapon.hit(enemy)
      end
    else
      raise NotARobotError
    end
  end

  def enemy_in_range?(enemy, range)
    Math.sqrt((enemy.position[0] - position[0])**2 +
              (enemy.position[1] - position[1])**2) <= range
  end

end












