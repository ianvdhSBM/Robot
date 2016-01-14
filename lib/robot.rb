require_relative 'item'
require_relative 'error'
require 'pry'

class Robot

  attr_reader :position, :items

  attr_accessor :equipped_weapon, :health


  def initialize
    @health = 100
    # @x_axis = 0
    # @y_axis = 0
    @position = [0, 0]
    @items = []
    @equipped_weapon = nil
  end

  def move_left
    position[0] -= 1
    # @position = [x_axis - 1, 0]
    # @x_axis -= 1
  end

  def move_right
    position[0] += 1
    # position = [x_axis + 1, 0]
    # @x_axis += 1
  end

  def move_up
    position[1] += 1
    # position = [0, y_axis + 1]
    # @y_axis += 1
  end

  def move_down
    position[1] -= 1
    # position = [0, y_axis - 1]
    # @y_axis -= 1
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
    if dmg > @health
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

  def heal!(regen)
    if health <= 0
      raise NoHealError, "You're dead! You can't heal!"
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
      raise NotARobotError, "you can only attack other robots!"
    end
  end

  def enemy_in_range?(enemy, range)
    Math.sqrt((enemy.position[0] - position[0])**2 +
              (enemy.position[1] - position[1])**2) <= range
  end

end












