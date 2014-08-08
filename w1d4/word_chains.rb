require "set"

class WordChainer
  attr_reader :dictionary
  
  def initialize
    @dictionary = []
    dictionary_file = "dictionary.txt"
    puts "Reading words from #{dictionary_file}"
    # read dictionary into @dictionary, a set 
    File.foreach(dictionary_file) do |word|
      word.chomp!
      @dictionary << word
    end
  end 
  
  def adjacent_words(word)
    # return all words one letter different from word
    results = Set.new []
    
    # go letter by letter. 
    (0...word.length).each do |i|
      poss_word = word.dup
      ("a".."z").each do |letter|
        poss_word[i] = letter
        next if poss_word == word
        results << poss_word if @dictionary.include? poss_word
      end # / a..z
    end # i
    results.to_a
  end # /adjacent_words

  
end

def testing
  chainer = WordChainer.new
  
  puts "Adjacent words for ruby"
  p chainer.adjacent_words("ruby")
  
  puts "adj: swam"
  p chainer.adjacent_words "swam"
end # /testing

testing
