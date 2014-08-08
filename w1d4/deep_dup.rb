class Array
  def deep_dup
    return [] if self.empty?
    
    results = []  
    self.each do |item|
      if item.is_a?(Array)
        results << item.deep_dup
      else
        results << item
      end
    end
    results
  end
  
end

def testing
  robot_parts = [
    ["nuts", "bolts", "washers"],
    ["capacitors", "resistors", "inductors"]
  ]
  
  puts "\nDeep_Dup copy of robot_parts"
  deep_duped = robot_parts.deep_dup
  p deep_duped
    
  puts "\nDup copy of robot_parts"
  duped = robot_parts.dup
  p duped
  
  puts "Modifying duped, checking deep_duped..."
  duped[1] << "LEDs"
  p deep_duped
  puts "and duped:"
  p duped
  
  puts "Testing mixed array [1, [2], [3, [4]]]..."
  mixed = [1, [2], [3, [4]]]
  mixed_deep_dup = mixed.deep_dup
  
  puts "now a change to the original: "
  mixed << [5]
  p mixed_deep_dup
  
end

testing