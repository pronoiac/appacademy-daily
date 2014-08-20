def substrings(str)
  answer = []
  (0...str.length).each do |index|
    (index...str.length).each do |j|
      answer.push str[index..j]
    end
  end
  answer
end

p substrings("cat")