bottle_count=99
while bottle_count>0
  unless bottle_count==1
    puts "#{bottle_count} bottles of beer on the wall, \n #{bottle_count} bottles of beer,\n take one down, pass it around,"
  else
    puts "#{bottle_count} bottle of beer on the wall, \n #{bottle_count} bottle of beer,\n take one down, pass it around,"
  end
  bottle_count-=1
  if bottle_count==0
    puts "no more bottles of beer on the wall!"
  elsif bottle_count==1
    puts "1 bottle of beer on the wall"
  else
     puts"#{bottle_count} bottles of beer on the wall"
  end
end
