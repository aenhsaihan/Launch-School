VALID_CHOICES = %w[rock paper scissors lizard spock]

def prompt(message)
	puts "=> #{message}"
end

def valid_letter?(letter)
	if letter == 's' then return false end
	VALID_CHOICES.map { |choice| choice.chr }.include?(letter)
end

def valid_choice?(choice)
	if choice.length > 1
		VALID_CHOICES.include?(choice)
	else
		valid_letter?(choice)
	end
end

def win?(player_one, player_two)
	(player_one == 'scissors' && player_two == 'paper') ||
	(player_one == 'paper' && player_two == 'rock') ||
	(player_one == 'rock' && player_two == 'lizard') ||
	(player_one == 'lizard' && player_two == 'spock') ||
	(player_one == 'spock' && player_two == 'scissors') ||
	(player_one == 'scissors' && player_two == 'lizard') ||
	(player_one == 'lizard' && player_two == 'paper') ||
	(player_one == 'paper' && player_two == 'spock') ||
	(player_one == 'spock' && player_two == 'rock') ||
	(player_one == 'rock' && player_two == 'scissors')
end

def display_results(player, computer)
	if win?(player, computer)
		prompt "You won!"
	elsif win?(computer, player)
		prompt "You lost!"
	else
		prompt "You tied!"
	end
end

def rewrite_choice(user_choice)
	if user_choice.length > 1
		user_choice
  else
    VALID_CHOICES.select { |choice| choice.start_with?(user_choice) }.first
  end
end

loop do
	choice = ''
	loop do
		prompt "Choose one: #{VALID_CHOICES.join(', ')}"
		choice = gets.chomp.downcase

		if valid_choice?(choice)
			break
		else
			if choice == 's'
				prompt "Please choose between scissors and spock"
			else
				prompt "That's not a valid choice"
			end
		end
	end

	computer_choice = VALID_CHOICES.sample

	puts "You chose: #{rewrite_choice(choice)}; Computer chose: #{computer_choice}"

	display_results rewrite_choice(choice), computer_choice

	prompt "Do you want to play again?"
	answer = gets.chomp
	break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Goodbye!"
