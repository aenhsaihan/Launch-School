arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# we want to use map to transform the array, but maintain the same structure
# now, we will be processing each subarray of the original array
# on each subarray, we also want to use map to transform the array so that each
# subarray is ordered according to its type
# so for letters
# maybe we will use sort_by instead of map, so that we can use a sorting criteria
# would a <=> b condition be sufficient for all the types?
# it would handle the letters well, and the integers obviously
# the array with words has different numbered words
# i would assume it comes out as 'black', 'blue', 'green'
# but it could come out as 'blue', 'black', 'green' due to the different lengths
# i could run a sort on just the chars of those words, and then assemble them back into words

arr.map do |subarray|
  subarray.sort do |a, b|
    b <=> a
  end
end
