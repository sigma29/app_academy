line_width=60
puts "Table of Contents".center(line_width)
puts "\n"
contents=["Chapter 1:  Getting Started","page  1","Chapter 2:  Numbers","page  9","Chapter 3:  Letters","page 13"]
contents.each do |string|
  if string=~/Chapter.*/
    print string.ljust(line_width/2)
  else
    puts (string).rjust(line_width/2)
  end
end
