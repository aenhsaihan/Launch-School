VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
	puts "=> #{message}"
end

def win?(player_one, player_two)
	(player_one == 'rock' && player_two == 'scissors') ||
	(player_one == 'paper' && player_two == 'rock') ||
	(player_one == 'scissors' && player_two == 'paper')
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

loop do
	choice = ''
	loop do
		prompt "Choose one: #{VALID_CHOICES.join(', ')}"
		choice = gets.chomp

		if VALID_CHOICES.include?(choice)
			break
		else
			prompt "That's not a valid choice"
		end
	end

	computer_choice = VALID_CHOICES.sample

	puts "You chose: #{choice}; Computer chose: #{computer_choice}"

	display_results choice, computer_choice

	prompt "Do you want to play again?"
	answer = gets.chomp
	break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Goodbye!"
