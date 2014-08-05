class Array
  def two_sum
    results = []
    
    for i in 0...self.length do 
      for j in i+1...self.length do 
        puts "checking: #{i} and #{j}"
        if self[i] + self[j] == 0
          results.push [i, j]
        end
      end
    end
    
    results
  end
end

# test.
p [-1, 0, 2, -2, 1].two_sum