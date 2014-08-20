
class Array
  def my_uniq
    unique = []
    self.each do |element|
      unless unique.include?(element)
        unique << element
      end
    end
    unique
  end
end

# testing.   
sample = [2, 1, 2, 3, 4, 3, 5]

puts sample.my_uniq