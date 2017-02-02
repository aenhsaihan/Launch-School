puts "the value of 40 + 2 is " + (40 + 2)

# The aboved does not work because you are trying to perform arithmetic on a string
# You can fix it by doing the below:

puts "the value of 40 + 2 is " + "#{(40 + 2)}"
