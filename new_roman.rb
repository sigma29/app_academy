def new_roman(num)
  roman=''
  if num>=1000
    times=num/1000
    roman='M' * times
    num=num%1000
  end
  if num>=500
    times=num/500
    if num>=900
      roman=roman+'CM'
      num=num-900
    else
      roman= roman + ('D' * times)
      num=num%500
    end

  end
  if num>=100
    times=num/100
    if times==4
      roman= roman +'CD'
    else
      roman= roman + ('C' * times)
    end
    num=num%100
  end
  if num>=50
    times=num/50
    if num>=90
      roman=roman+'XC'
      num=num-90
    else
      roman= roman + ('L' * times)
      num=num%50
    end

  end
  if num>=10
    times=num/10
    if times==4
      roman=roman+'XL'
    else
      roman= roman + ('X' * times)
    end
    num=num%10
  end
  if num>=5
    times=num/5
    if num==9
      roman=roman+ "IX"
      num=0
    else
      roman= roman + ('V' * times)
      num=num%5
    end

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

puts new_roman(1698)
puts new_roman(9)
puts new_roman(545)
puts new_roman(999)
