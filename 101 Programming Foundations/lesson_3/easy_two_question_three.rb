ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# Understand the problem

# We need to add the hash below to the ages hash
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# => Input
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# => Output
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Examples / Test Cases
# add_hash(first_hash, second_hash)

# Data Structure
#
# We wil be working with a hash

# Algorithm
#
# Add the additional_ages hash to the ages hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
