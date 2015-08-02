def old_roman(num)
  roman=''
  if num>=1000
    times=num/1000
    roman='M' * times
    num=num%1000
  end
  if num>=500
    times=num/500
    roman= roman + ('D' * times)
    num=num%500
  end
  if num>=100
    times=num/100
    roman= roman + ('C' * times)
    num=num%100
  end
  if num>=50
    times=num/50
    roman= roman + ('L' * times)
    num=num%50
  end
  if num>=10
    times=num/10
    roman= roman + ('X' * times)
    num=num%10
  end
  if num>=5
    times=num/5
    if num==9
      roma=roman+ "IX"
    else
      roman= roman + ('V' * times)
    end
    num=num%5
  end
  if num>=1
    times=num/1
    if times==4
      roman=roman+'IV'
    else
      roman= roman + ('I' * times)
    end
    num=num%1
  end
  return roman
end

puts old_roman(1698)
puts old_roman(9)
puts old_roman(545)
puts old_roman(67)
puts old_roman(105)
