munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original munsters_description above):

# Understand the problem

# It looks like I have to manipulate the string in a way,
# where the original string is rewritten in the way above.

# The first string, the sentence should be capitalized
# The second string, capitilization of the string should be reversed.
# The third string, all characters should be lower-cased.
# The fourth string, all characters shoudl be upper-cased.

# => Inputs
#
# Input will be string given above in munsters_description
# "The Munsters are creepy in a good way."

# => Outputs
#
# Output will be the below:
# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# Examples / Test Cases:
#
# capitalize(munsters_description)
# reverse(munsters_description)
# lowercase(munsters_description)
# uppercase(munsters_description)

# Data Structure
#
# We'll be using string for our data Structure

# Algorithm

# First, we will capitalize the string
# Second, we will reverse the casing of the string
# Third, we will lower case the string
# Fourth, we will uppercase the string

puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.upcase
puts munsters_description.downcase