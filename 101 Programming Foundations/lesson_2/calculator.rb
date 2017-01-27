require 'yaml'
MESSAGES = YAML.load_file("configuration.yml")

LANGUAGE = 'en'

def messages(key, lang='en')
	MESSAGES[lang][key]
end

def prompt(key)
	message = messages(key, LANGUAGE)
	Kernel.puts("=> #{message}")	
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

def operation_to_message(op)
	verb = case op
					when '1'
						'Adding'
					when '2'
						'Subtracting'
					when '3'
						'Multiplying'
					when '4'
						'Dividing'
					end

	verb
end

prompt("greeting")

name = ''
loop do
	name = Kernel.gets.chomp
	
	if name.empty?
		prompt("name_error")
	else
		break
	end
end

prompt("hello")

loop do #main loop
	
	number1 = ''
	loop do
		prompt("first_number")
		number1 = Kernel.gets().chomp
		
		if valid_number?(number1)
			break
		else
			prompt("number_error")
		end
	end
	
	number2 = ''
	loop do
		prompt("second_number")
		number2 = Kernel.gets().chomp
		
		if valid_number?(number2)
			break
		else
			prompt("number_error")
		end
	end
	
	operator_prompt = <<-MSG
		What operation would you like to perform on these two numbers?
		1) add
		2) subtract
		3) multiply
		4) divide
	MSG
		
	puts "=> #{operator_prompt}"
	
	operator = ''
	loop do
		operator = Kernel.gets.chomp
		
		if %w(1 2 3 4).include?(operator)
			break
		else
			prompt("operator_error")
		end
	end

	puts "=> #{operation_to_message(operator)} the two numbers..."
	
	result = case operator
						when '1'
							number1.to_i + number2.to_i
					 	when '2'
					 		number1.to_i - number2.to_i
					 	when '3'
					 		number1.to_i * number2.to_i
					 	when '4'
					 		number1.to_f / number2.to_f
	end
	
	puts "The result is #{result}"
	
	prompt("subsequent_request")
	answer = Kernel.gets().chomp
	
	break unless answer.downcase().start_with?('y')
end

prompt("parting_words")
