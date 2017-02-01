ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if Spot is present in the hash above

# Understand the problem
#
# I need to find a way to see if Spot is a key within the hash 'ages'

# => Inputs
# ages hash

# => Outputs
# We should output true or false

# Examples/Test Cases
#
# ages.fetch('Herman') { |el| "#{el} is not a key"}
# ages.fetch('Spot') { |el| "#{el} is not a key"}

# Data Structure
#
# We are working with a hash

# Algorithm
#
# Inspect the hash for a key called Spot
# => Use a built-in hash method to discover whether Spot is a key or not

puts ages.fetch('Spot') { |el| "#{el} is not present in the hash"}
