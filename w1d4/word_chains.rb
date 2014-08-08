require "set"

class WordChainer
  attr_reader :dictionary, :current_words, :all_seen_words
  
  def initialize
    @dictionary = []
    dictionary_file = "dictionary.txt"
    puts "Reading words from #{dictionary_file}"
    # read dictionary into @dictionary, a set 
    File.foreach(dictionary_file) do |word|
      word.chomp!
      dictionary << word
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
  
  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]
    @new_current_words = []
    steps = 1
    until @current_words.empty? 
      @new_current_words = []
      @current_words.each do |word|
        # puts "current word: #{word}"
        adjacent_words(word).each do |adjacent|
          next if @all_seen_words.include?(adjacent)
          @all_seen_words << adjacent
          @new_current_words << adjacent
        end
      end
      print "Step #{steps}, #{@new_current_words.count} new words, "
      puts "#{current_words.count} words total previously: \n"
      puts "#{@new_current_words}"
      puts
      @current_words = @new_current_words
      steps += 1
    end
  end

  
end

def testing
  chainer = WordChainer.new
  
  puts "Adjacent words for ruby"
  p chainer.adjacent_words("ruby")
  
  puts "adj: swam"
  p chainer.adjacent_words "swam"
  
  # puts "swam -> ruby?"
  # p chainer.run "swam", "ruby"
  
  # puts "rows -> tail?"
  puts "vent -> beam? (slow - 4 min?)"
  p chainer.run "vent", "beam"
  
  # p chainer.run "chunder", "plunder"
end # /testing

testing
