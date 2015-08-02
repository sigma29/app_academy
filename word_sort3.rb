def sort(array)
  recursive_sort(array,[])
end

def recursive_sort(unsorted_array, sorted_array)
  if unsorted_array==[]
    return sorted_array
  else
    smallest=unsorted_array[0]
    i=0
    while i<unsorted_array.length
      if unsorted_array[i].downcase < smallest.downcase
        smallest=unsorted_array[i]
      end
      i+=1
    end
    unsorted_array.delete(smallest)
    sorted_array.push(smallest)
    return recursive_sort(unsorted_array, sorted_array)
  end
end
test=%w{This is a test}
puts sort(test)
