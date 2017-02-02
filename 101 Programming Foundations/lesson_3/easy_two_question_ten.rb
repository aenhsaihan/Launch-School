title = "Flintstone Family Members"

# Understand the problem

# We have a 40 character wide table of Flintstone family members.
# How can we center the title the table using spaces.

# => Input
# title = "Flintstone Family Members"

# => Output
# (spaces)Flintstone Family Members(spaces)

# Examples / Test Cases
#
# Let's say we have a title with 5 characters but a table of 10 spaces
#
# Spaces would look like
# oooooooooo
#
# The title should look like
# oooxxxxxoo
#
# Seems like a table of even numbered spaces presents us with a problem
# Whereas odd numbered spaces would have made it a bit easier
# But if we have an even numbered title, it would be easy like below:
# ooxxxxxxoo
#
# Exceptions:
#
# What if the length of the title is even numbered? How would you divide that by two?
# You would not get a whole number
# What to do with fractional numbers???


# Data Structure
# We are using a string

# Algorithm
#
# Get the length of the string
# => If we have an even number length, we are good to go
#### => Simply subtract the length from the number of spaces available (40)
#### => Then, divide the result by two, and add that number as spaces to both ends of the string

# OR
# => You could subtract the length of the string from the number of spaces
#### => With the leftover spaces, you could add half of that number as spaces to the beginning and end of the string

spaces_in_table = 40
leftover_spacing = spaces_in_table - title.length
spaces_for_each_side = leftover_spacing / 2
whitespace = " " * spaces_for_each_side

result = whitespace + title + whitespace + " "
