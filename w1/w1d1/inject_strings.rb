def concatenate(s)
  s.inject { |words, word| words + word }
end

# test 
p concatenate(["Yay ", "for ", "strings!"])
# => "Yay for strings!"


