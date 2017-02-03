# A:

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one

  # variable local to method 'one' is being reassigned as two
  # variable local to method 'two' is being reassigned as three
  # variable local to method 'three' is being reassigned as one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

# inside the method {
 # one = "two"
 # two = "three"
 # three = "one"
#}

puts "one is: #{one}" # => "one is: one"
puts "two is: #{two}" # => "one is: two"
puts "three is: #{three}" # => "one is: three"

# B:

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "one is: one"
puts "two is: #{two}" # => "one is: two"
puts "three is: #{three}" # => "one is: three"

# C:

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "one is: two"
puts "two is: #{two}" # => "two is: three"
puts "three is: #{three}" # => "three is: one"