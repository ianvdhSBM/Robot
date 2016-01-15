class NoHealError < StandardError  
 puts "You're dead! You can't heal!"
end

class NotARobotError < StandardError
  puts "You can only attack other robots!"
end
