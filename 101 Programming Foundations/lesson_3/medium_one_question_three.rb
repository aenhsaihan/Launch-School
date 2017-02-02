def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# What is the purpose of the number % dividend == 0 ?
# The purpose is to see if the number is divisible by the dividend without producing a remainder

# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
# It returns an arary of all the factors for the number that was passed to the method.