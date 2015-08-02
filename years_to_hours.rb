def years_to_hours(years)
  return years*365*24
end

def years_to_minutes(years)
  minutes=years_to_hours(years)*60
  puts "There are #{minutes} minutes in #{years} years."
  return minutes
end

def years_to_seconds(years)
 seconds=years_to_minutes(26)
 puts "A #{years} year old is #{seconds*60} seconds old"
end

def seconds_to_years(seconds)
  return seconds/60.0/60.0/24.0/365.0
end

puts years_to_hours(1)
years_to_minutes(10)
years_to_seconds(26)

puts "The author is #{seconds_to_years(1025000000).to_i} years old"
