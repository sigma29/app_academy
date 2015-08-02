def english_number(number)
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


bottle_count=99
while bottle_count>0
  unless bottle_count==1
    puts "#{english_number(bottle_count)} bottles of beer on the wall, \n #{english_number(bottle_count)} bottles of beer,\n take one down, pass it around,"
  else
    puts "#{english_number(bottle_count)} bottle of beer on the wall, \n #{english_number(bottle_count)} bottle of beer,\n take one down, pass it around,"
  end
  bottle_count-=1
  if bottle_count==0
    puts "no more bottles of beer on the wall!"
  elsif bottle_count==1
    puts "one bottle of beer on the wall"
  else
     puts"#{english_number(bottle_count)} bottles of beer on the wall"
  end
end
