words=[]
while true
  word=gets.chomp
  if word==''
    break
  else
    words<<word
  end
end

puts words.sort
