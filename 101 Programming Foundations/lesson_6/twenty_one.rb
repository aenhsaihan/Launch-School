BLACKJACK = 35

numbered_cards = (2..10).to_a
face_cards = ['J', 'Q', 'K', 'A']
cards = numbered_cards + face_cards
suits = ['H', 'C', 'D', 'S']

deck = suits.product(cards.map(&:to_s))

def prompt(message)
  puts "=> #{message}"
end

def total(cards)
  values = cards.map(&:last)

  sum = 0
  values.each do |value|
    sum += if value == 'A'
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end

  # adjust total for aces in hand
  aces = values.count { |value| value == 'A' }
  aces.times { sum -= 10 if sum > BLACKJACK }

  sum
end

def busted?(cards)
  total(cards) > BLACKJACK
end

def decide_winner(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  # determine who won between the player and the dealer
  if player_total > BLACKJACK
    :player_busted
  elsif dealer_total > BLACKJACK
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie
  end
end

def display_winner(player_cards, dealer_cards)
  result = decide_winner(player_cards, dealer_cards)

  puts '---------------'

  case result
  when :player_busted
    prompt "You busted, dealer wins!"
  when :dealer_busted
    prompt "Dealer busted, you won!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie, dealer wins!"
  end
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
  2.times do
    player_cards << deal_card(deck)
    dealer_cards << deal_card(deck)
  end
end

def dealer_decision(dealer_cards)
  total(dealer_cards) < (BLACKJACK - 4) ? 'hit' : 'stay'
end

def verbalize(cards)
  cards = cards.map(&:last)

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

def play_again?
  puts '---------------'
  prompt 'Do you want to play again? (y or n)'
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def declare_winner(scores)
  if scores[:player] == 5
    puts "You have won the game!"
    scores[:player] = 0
    scores[:dealer] = 0
  elsif scores[:dealer] == 5
    puts "Dealer has won the game!"
    scores[:player] = 0
    scores[:dealer] = 0
  else
    puts "Current score: Player: #{scores[:player]} Dealer: #{scores[:dealer]}"
  end
end

def grand_output(player_cards, dealer_cards, scores)
  display_winner(player_cards, dealer_cards)
  # both player and dealer stays - compare cards!
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="

  declare_winner(scores)
end

def initial_scores
  { player: 0, dealer: 0 }
end

def keep_score(scores, result)
  case result
  when :dealer, :player_busted, :tie
    scores[:dealer] += 1
  when :player, :dealer_busted
    scores[:player] += 1
  end

  scores
end

scores = initial_scores
loop do
  player_cards = []
  dealer_cards = []
  deal_cards(player_cards, dealer_cards, deck)

  loop do
    inform_player(player_cards, dealer_cards)

    if busted?(player_cards)
      answer = 'stay'
    else
      prompt 'hit or stay?'
      answer = gets.chomp.downcase
    end
    break if answer == 'stay' || busted?(player_cards)

    if answer.casecmp('hit') == 0 # I really don't like this over downcase
      player_cards << deal_card(deck)
    else
      prompt "Sorry, didn't recognize that command"
    end
  end

  player_total = total(player_cards)
  if busted?(player_cards)
    keep_score(scores, decide_winner(player_cards, dealer_cards))
    grand_output(player_cards, dealer_cards, scores)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}!"
  end

  # onto the dealer
  answer = ''
  loop do
    break if answer == 'stay' || busted?(dealer_cards) || busted?(player_cards)
    answer = dealer_decision(dealer_cards)
    dealer_cards << deal_card(deck) unless answer == 'stay'
  end

  dealer_total = total(dealer_cards)
  if busted?(dealer_cards)
    prompt "Dealer total is at #{dealer_total}!"
    keep_score(scores, decide_winner(player_cards, dealer_cards))
    grand_output(player_cards, dealer_cards, scores)
    play_again? ? next : break
  else
    prompt "Dealer stayed at #{dealer_total}!"
  end

  keep_score(scores, decide_winner(player_cards, dealer_cards))
  grand_output(player_cards, dealer_cards, scores)

  break unless play_again?

  return_cards(player_cards, dealer_cards, deck)
end

prompt "Goodbye, and thanks for playing!"
