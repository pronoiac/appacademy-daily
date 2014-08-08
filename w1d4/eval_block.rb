def eval_block(*my_arg_array, &proc)
  return "NO BLOCK GIVEN" if proc == nil
  proc.call *my_arg_array  
end

def testing
  # Example calls to eval_block
  puts "1. test a template"
  eval_block("Kerry", "Washington", 23) do |fname, lname, score|
    puts "#{lname}, #{fname} won #{score} votes."
  end
  # => Washington, Kerry won 23 votes.
  
  puts "\n2. test inject."
  return_value = eval_block(1,2,3,4,5) do |*args|
    args.inject(:+)
  end  
  # => 15
  p "#{return_value}"
  
  puts "\n3. man, I don't give a block."
  p eval_block(1, 2, 3)
  # => "NO BLOCK GIVEN"
  
end

testing