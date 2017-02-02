advice = "Few things in life are as important as house training your pet dinosaur."

# Understand the problem

# use that method to make the return value "Few things in life are as important as ".
# But leave the advice variable as "house training your pet dinosaur.".

# => Input
# advice = "Few things in life are as important as house training your pet dinosaur."

# => Ouput
# advice = "house training your pet dinosaur."
# sliced = "Few things in life are as important as"

# Examples / Test Cases

# Data Structure
# String

# Alogrithm
#
# Slice the advice string starting from house until the end of the string
# => Return that output into another variable

sliced_advice = advice.slice!(/house.+/)
