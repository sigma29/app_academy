require 'byebug'
def english_number(number)
  debugger
  if number <0 # No negative numbers
    return "Please enter a number that isn't negative."
  end
  if number==0
    return 'zero'
  end

  num_string=''# initialize return value
  ones_place = %w{one two three four five six seven eight nine}
  tens_place= %w{ten twenty thirty forty fifty sixty seventy eighty ninety}
  teenagers = %w{eleven twelve thirteen fourteen fifteen sixteen seventeen
    eighteen, nineteen}
  #' left is the portion of the number remainint to write out'
  # write is the part we are writing out right now


  left=number
  #Do the millions place
  write=left/1000000
  left = left - write*1000000

  if write >0
    millions = english_number write
    num_string = num_string + millions + " million"
    if left >0
      num_string = num_string + ' '
    end
  end

  #Do the thousands place
  write=left/1000
  left=left - write*1000

  if write >0
    thousands = english_number write
    num_string = num_string + thousands + " thousand"
    if left >0
      num_string = num_string + ' '
    end
  end

  # Do the hundreds place
  write=left/100
  left = left - write*100
  if write > 0
    hundreds = english_number write
    num_string = num_string + hundreds + ' hundred'
    if left > 0
      num_string = num_string + ' '
    end
  end

  #do the tens place
  write=left/10
  left=left - write*10
  if write > 0
    if (write == 1) && (left > 0)
      #handle those pesky teens
      num_string = num_string + teenagers[left-1]
      left=0
    else
      num_string = num_string + tens_place[write-1]
    end
    if left > 0
      num_string = num_string + '-'
    end
  end

  #do ones place
  write = left
  left = 0

  if write > 0
    num_string = num_string + ones_place[write-1]
  end
  return num_string
end

if __FILE__ == $PROGRAM_NAME
  puts english_number(0)
  puts english_number(9)
  puts english_number(10)
  puts english_number(11)
  puts english_number(17)
  puts english_number(32)
  puts english_number(88)
  puts english_number(99)
  puts english_number(100)
  puts english_number(101)
  puts english_number(234)
  puts english_number(3211)
  puts english_number(999999)
  puts english_number(9999999)
  puts english_number(23304560)
end
