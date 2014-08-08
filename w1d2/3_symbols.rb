def super_print(str, options = {})
  defaults = {
    :times => 1,
    :upcase => false,
    :reverse => false
  }
  options = defaults.merge(options)
  
  results = str.dup # to avoid object copy
  results.upcase! if options[:upcase] 
  results.reverse! if options[:reverse]
  puts results * options[:times] 
end

# testing
super_print("Hello")                                    #=> "Hello"
super_print("Hello", :times => 3)                       #=> "Hello" 3x
super_print("Hello", :upcase => true)                   #=> "HELLO"
super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"

options = {}
super_print("hello", options)
# options shouldn't change.

