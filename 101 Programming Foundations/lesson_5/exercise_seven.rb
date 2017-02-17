a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# arr has [a, b] which are pointers, so essentially it's [2, [5,8]]
# arr[0] += 2 would be 2 + 2 = 4, so now we're at [4, [5,8]]
# arr[1][0] -= a would be 5 -= 4, which would leave us at [4, [1,8]]

# => [4, [1,8]]

# a = 2 pointer was replaced with a different assignment, so original pointer does not change
# b = [3, 8] array was modified, that's why the pointer reflects the change