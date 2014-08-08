# prompt for file
puts "I shuffle the lines of a file at random, into a new file."
puts "What file do you want to shuffle?"
in_file = gets.chomp
lines = []

# read file
File.foreach(in_file) do |line|
  line.chomp!
  lines << line
end 

# shuffle lines
lines.shuffle! 

# write new file
out_file = in_file + "-shuffled.txt"
File.open(out_file, 'w')  {|file| file.write (lines.join ("\n"))}
