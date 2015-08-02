def shuffle(array)
  recursive_shuffle(array,[])
end

def recursive_shuffle(original,shuffled)
 if original==[]
   return shuffled
 else
   pick=rand(original.length)
   shuffled << original[pick]
   original.delete(original[pick])
   return recursive_shuffle(original,shuffled)
 end
end

test=%w{Here is a somewhat longer test}
puts shuffle(test)
puts "again"
puts shuffle(test)
puts shuffle(test)
