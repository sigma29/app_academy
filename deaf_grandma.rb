speech=''
bye_count=0
prev_speech=''
while true
  speech=gets.chomp
  if speech=="BYE"
     bye_count+=1
    if bye_count==3
      puts "GUESS YOU DON'T WANT TO SPEAK TO YOUR OLD GRANNY!"
      break
    else
      puts "WHAT?"
    end
  else
    bye_count=0
    if speech!=speech.upcase || speech==''
      puts "HUH?! SPEAK UP, SONNY"
    else
      year=1930+rand(21)
      puts "NO, NOT SINCE " << year.to_s
    end
  end
end
