title = The Flintstones Rock!

# Understand the problem
#
# I believe I have to indent the title above ten times

# => Input
# The Flintstones Rock!

# => Output
# The Flintstones Rock! indented ten times, over ten lines

# Examples / Test Cases

# data type, exceptions, boundaries

# Data Structure
#
# String

# Algorithm
#
# Print a string ten times
# => For each time, indent the string once more than the previous time

10.times { |number_of_spaces| puts " " * number_of_spaces + title }