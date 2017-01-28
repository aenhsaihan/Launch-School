require 'yaml'
MESSAGES = YAML.load_file("mortgage_configuration.yml")

def prompt(key)
  message = MESSAGES[key]
  puts "=> #{message}"
end

def float?(num)
  Float(num) rescue false
end

def integer?(num)
  Integer(num) rescue false
end

def number?(num)
  integer?(num) || float?(num)
end

def valid_number?(num)
  number?(num)
end

def calculate_monthly_interest_rate(apr)
  apr / 12
end

def calculate_monthly_payment(loan_amount, apr, loan_duration_months)
  p = loan_amount.to_f
  n = loan_duration_months.to_i
  j = calculate_monthly_interest_rate(apr)

  m = p * (j / (1 - (1 + j)**-n))

  '%.2f' % m
end

loop do
  
  loan_amount = ''
  loop do
    prompt("loan_amount")
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      break
    else
      prompt("number_error")
    end
  end

  apr = ''
  loop do
    prompt("apr")
    apr = (gets.chomp.to_f / 100)

    if valid_number?(apr)
      break
    else
      prompt("number_error")
    end
  end

  loan_duration_months = ''
  loop do
    prompt("loan_duration")
    loan_duration_months = gets.chomp

    if valid_number?(loan_duration_months)
      break
    else
      prompt("number_error")
    end
  end

  monthly_payment = calculate_monthly_payment(loan_amount, apr, loan_duration_months)
  puts "Your monthly payment is $#{monthly_payment}"

  prompt("subsequent_request")
  answer = gets.chomp
  
  break unless answer.downcase().start_with?('y')

end

prompt("parting_words")
