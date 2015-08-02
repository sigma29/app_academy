def old_roman(num)
  key=[[1000,'M'],[500,'D'],[100,'C'],[50,'L'],[10,'X'],[5,'V'],[1,'I']]
  roman=''
  index=0
  while index<=6
    value=key[index][0]
    numeral=key[index][1]
    if num>=value
      times=num/value
      roman=roman << numeral * times
      num=num%value
    end
    index+=1
  end

  return roman
end

puts old_roman(1698)
puts old_roman(9)
puts old_roman(545)
puts old_roman(67)
puts old_roman(105)
