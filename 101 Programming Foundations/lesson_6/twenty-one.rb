numbered_cards = (1..10).to_a
face_cards = ['J', 'Q', 'K', 'A']
cards = numbered_cards + face_cards
suits = ['H', 'C', 'D', 'S']

deck = []
suits.each do |suit|
  cards.each do |card|
    deck << ["#{suit}", "#{card}"]
  end
end

def prompt(message)
  puts "=> #{message}"
end

def total(cards)
  values = cards.map { |card| card.last }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # adjust total for aces in hand
  aces = values.select { |value| value == 'A' }
  aces.count.times { sum -= 10 if sum > 21 }

  sum
end

def busted?(cards)
  if total(cards) > 21
    true
  else
    false
  end
end

def decide_winner(player_cards, dealer_cards)
  # determine who won between the player and the dealer

end

def display_winner(player_cards, dealer_cards)
  winner = decide_winner(player_cards, dealer_cards)
  prompt "The winner is #{winner}"
end

def deal_cards(player_cards, dealer_cards, deck)
  2.times { player_cards << deck.delete(deck.sample)}
  2.times { dealer_cards << deck.delete(deck.sample)}
end

def dealer_decision(dealer_cards)
  total(dealer_cards) < 17 ? 'hit' : 'stay'
end

def inform_player(player_cards, dealer_cards)
  known_card = dealer_cards.first
  prompt "Dealer has #{known_card} and an unknown card"

  prompt "You have #{player_cards}"
end


loop do
  player_cards = []
  dealer_cards = []
  deal_cards(player_cards, dealer_cards, deck)

  loop do
    inform_player(player_cards, dealer_cards)
    prompt 'hit or stay?'
    answer = gets.chomp.downcase
    break if answer == 'stay' || busted?(player_cards)
    player_cards << deck.delete(deck.sample)
  end

  if busted?(player_cards)
    prompt 'You busted!'
  else
    prompt 'You stayed!'
  end

  # onto the dealer
  answer = ''
  loop do
    break if answer == 'stay' || busted?(dealer_cards)
    answer = dealer_decision(dealer_cards)
    dealer_cards << deck.delete(deck.sample) unless answer == 'stay'
  end

  if busted?(dealer_cards)
    prompt 'Dealer busted!'
  else
    prompt 'Dealer stayed!'
  end

  display_winner(player_cards, dealer_cards)

  prompt "Would you like to play again? (y or n)"
  answer = gets.chomp.downcase
  break unless answer == 'y'

  player_cards = []
  dealer_cards = []
end

prompt "Goodbye, and thanks for playing!"