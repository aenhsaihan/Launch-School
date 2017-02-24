numbered_cards = (2..10).to_a
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
  if busted?(player_cards)
    'dealer'
  elsif busted?(dealer_cards)
    'player'
  elsif total(player_cards) > total(dealer_cards)
    'player'
  elsif total(dealer_cards) > total(player_cards)
    'dealer'
  end
end

def display_winner(player_cards, dealer_cards)
  winner = decide_winner(player_cards, dealer_cards)
  prompt "The winner is #{winner}"
end

def deal_card(deck)
  deck.delete(deck.sample)
end

def return_cards(player_cards, dealer_cards, deck)
  until player_cards.empty?
    deck << player_cards.pop
  end

  until dealer_cards.empty?
    deck << dealer_cards.pop
  end
end

def deal_cards(player_cards, dealer_cards, deck)
  2.times { player_cards << deal_card(deck)}
  2.times { dealer_cards << deal_card(deck)}
end

def dealer_decision(dealer_cards)
  total(dealer_cards) < 17 ? 'hit' : 'stay'
end

def verbalize(cards)
  cards = cards.map { |card| card.last }

  case cards.size
    when 2 then "#{cards.first} and #{cards.last}"
    else
      cards[-1] = "and #{cards.last}"
      cards.join(', ')
  end
end

def inform_player(player_cards, dealer_cards)
  known_card = dealer_cards.first
  prompt "Dealer has #{known_card.last} and an unknown card"

  prompt "You have #{verbalize(player_cards)}"
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
    player_cards << deal_card(deck)
  end

  if busted?(player_cards)
    prompt 'You busted!'
  else
    prompt 'You stayed!'
  end

  # onto the dealer
  answer = ''
  loop do
    break if answer == 'stay' || busted?(dealer_cards) || busted?(player_cards)
    answer = dealer_decision(dealer_cards)
    dealer_cards << deal_card(deck) unless answer == 'stay'
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

  return_cards(player_cards, dealer_cards, deck)
end

prompt "Goodbye, and thanks for playing!"