def substrings(str)
  answer = []
  (0...str.length).each do |index|
    (index...str.length).each do |j|
      answer.push str[index..j]
    end
  end
  answer
end

def subwords(str)
  results = []
  
  #get substrings
  segments = substrings(str)
  
  #look for matches in dictionary as we go through it
  File.foreach("dictionary.txt") do |line|
    line.chomp!
    results.push(line) if segments.include?(line)
  end
  
  #return an array of actual words
  results
end

# testing
p subwords("cats")
p subwords("intelligent")