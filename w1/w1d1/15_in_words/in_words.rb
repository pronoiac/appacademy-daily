require 'debugger'

class Fixnum
  
  def chunk(num)  
    result = []
    
    ones_dictionary = { 
       0 => '',
       1 => 'one',
       2 => 'two',
       3 => 'three',
       4 => 'four',
       5 => 'five',
       6 => 'six',
       7 => 'seven',
       8 => 'eight',
       9 => 'nine',
       10 => 'ten',
       11 => 'eleven',
       12 => 'twelve',
       13 => 'thirteen',
       14 => 'fourteen',
       15 => 'fifteen',
       16 => 'sixteen',
       17 => 'seventeen',
       18 => 'eighteen',
       19 => 'nineteen'
     }
     tens_dictionary = {
       20 => 'twenty',
       30 => 'thirty',
       40 => 'forty',
       50 => 'fifty',
       60 => 'sixty',
       70 => 'seventy',
       80 => 'eighty',
       90 => 'ninety'
     }
    # indention protection
    if num == 0
      result << 'zero'
    elsif num.between? 1, 19
      result << ones_dictionary[num]
    elsif num.between? 20, 99
      # debugger
      result << tens_dictionary[(num / 10)*10]
      ones = num % 10
      result << ones_dictionary[ones] unless ones == 0
    elsif num.between? 100, 999
      # debugger
      result << ones_dictionary[num / 100]
      result << "hundred"
      ones = num % 100
      result += chunk (ones) unless ones == 0
    end
    
    result
  end
  
  def in_words
    return "zero" if self == 0
    return "one" if self == 1
    
    magnitudes = ["thousand", "million", "billion", "trillion"]
    num = self
    result = []
    place = -1
    while num > 0
      digits = num % 1000
      temp = []
      temp += chunk(digits) unless digits == 0
      temp.push magnitudes[place] if place >= 0 && digits != 0
      result = temp + result 
      place += 1
      num /= 1000      
    end
    result.join(' ')
    
  end
end
 
if __FILE__ == $PROGRAM_NAME
  puts 20.in_words
  puts 21.in_words
  puts 2001.in_words
end