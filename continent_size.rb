M='land'
o='water'
world=[[o,o,o,o,o,o,o,o,o,o,o],
      [o,o,o,o,o,o,M,M,o,o,o],
      [M,o,o,o,o,o,o,o,o,M,M],
      [o,o,o,M,o,o,o,o,o,o,M],
      [o,o,o,M,o,M,M,o,o,o,o],
      [o,o,o,o,M,M,M,M,o,o,o],
      [o,o,o,o,o,o,o,o,o,o,o],
      [o,o,o,o,o,o,o,o,o,o,o],
      [o,o,o,o,o,o,o,o,o,o,o],
      [o,o,o,o,o,o,o,o,o,o,o],
      [o,o,o,o,o,o,o,o,o,o,o]]
def continent_size world, x, y
  if (x<0 || y<0 || y>10 || x>10)
    return 0
  elsif world[y][x]!='land'
    return 0
  end
  size =1
  world[y][x]= 'counted land'
  size =size + continent_size(world,x-1,y-1)
  size =size + continent_size(world,x,y-1)
  size =size + continent_size(world,x+1,y-1)
  size =size + continent_size(world,x-1,y)
  size =size + continent_size(world,x+1,y)
  size =size + continent_size(world,x-1,y+1)
  size =size + continent_size(world,x,y+1)
  size =size + continent_size(world,x+1,y+1)

  size
end

puts continent_size(world, 10, 3)
puts continent_size(world, 0, 2)
puts continent_size(world, 1,8)
puts continent_size(world, 3,3)
