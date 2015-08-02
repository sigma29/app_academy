def sort(array)
  to_be_sorted=array
  sorted=[]
  while to_be_sorted!=[]
    size=to_be_sorted.length
    smallest=to_be_sorted[0]
    i=0
    while i<size
      if array[i].downcase < smallest.downcase
        smallest=array[i]
      end
      i+=1
    end
    to_be_sorted.delete(smallest)
    sorted << smallest
  end
  return sorted
end

test=%w{This is a test}
puts sort(test)
