start_year=nil
end_year=nil
until start_year!=nil && end_year!=nil
  print "What year should we start with? "
  start_year=gets.chomp.to_i
  print "What year should we end with? "
  end_year=gets.chomp.to_i
  if end_year<start_year
    puts "The ending year must be after the start year.  Pleas try again"
    start_year=nil
    end_year=nil
  end
end

year=start_year
while year<=end_year
  if year%4==0
    if year%400==0
      puts year
    elsif year%100==0
    else
      puts year
    end
  end
  year+=1
end
