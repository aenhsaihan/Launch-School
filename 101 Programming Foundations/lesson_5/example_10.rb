[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# [[1, 2], [3, 4]]
# [5, 6]

# [[1, 2], [3, 4]] passed in as arr, map is called on arr.map
# [1, 2], [3, 4] each passed in as el into the block
# [1, 2].to_s.size == 1 would return false because it's an array
# goes to else condition
# [1, 2].map is called
# [3, 4].map is called
# 1, 2 is passed into the block as n
# 3, 4 is passed into the block as n
# block performs 1 + 1, 2 + 1
# block performs 3 + 1, 4 + 1
# block returns [2, 3] to map, which in turn returns that to the second map function, which then returns it to the outer map function
# block returns [4, 5] to map, which in turn returns that to the second map function, which then returns it to the outer map function
# the second map returns [[2, 3], [4, 5]], which is then returned to the outer map function as the first transformed value

# [5, 6] gets passed in as arr, map is called on arr.map
# 5 and 6 get passed in as el into the block
# 5.to_s.size == 1 would return true because we are dealing with an integer
# 5 + 1 returns 6, and 6 + 1 returns 7 back to the arr.map to transform the original [5, 6] into [6, 7]
# [6, 7] returned by arr.map is return to the outer map which then provides the last transformed value

# => [[[2, 3], [4, 5]], [6, 7]]
