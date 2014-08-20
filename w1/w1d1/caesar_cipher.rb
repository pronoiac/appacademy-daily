def caesar(phrase, shift) 
  alphabet = ('a'..'z').to_a
  result = ''
  
  phrase.split('').each do |letter|
    if alphabet.include?(letter)
      result += alphabet[(alphabet.index(letter) + shift) % 26]
    else
      result += letter
    end
  end
  result
end


#test
def test
  p caesar("the quick brown fox jumps over the lazy dog", 23)
  p "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD".downcase
end

test 