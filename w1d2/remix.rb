def remix(arr)
  alcohols = []
  mixers = []
  
  arr.each do |pair|
    alcohols << pair[0]
    mixers << pair[1]
  end
  
  alcohols.shuffle!
  mixers.shuffle!
  
  results = []
  
  alcohols.each_with_index do |alcohol, index|
    mixer = mixers[index]
    results << [alcohol, mixer]
  end
  
  results
end

# test
p remix([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])