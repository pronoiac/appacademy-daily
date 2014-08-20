class Array
  def my_each
    for i in 0...self.count do
      yield self[i]
    end
    self
  end
  
  # def my_each(&prc)
  #   for i in 0...self.count do
  #     prc.call(self[i])
  #   end
  #   self
  # end
end

# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end


p return_value # => [1, 2, 3]