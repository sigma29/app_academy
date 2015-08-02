print "What's your first name? "
first_name=gets.chomp
print "What's your middle name? "
middle_name=gets.chomp
print "What's your last name? "
last_name=gets.chomp
puts "Hello, #{first_name} #{middle_name} #{last_name}"
puts ("There are #{first_name.length + middle_name.length + last_name.length} letters in your name".center(50)) 
