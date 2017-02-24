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

def busted?
  false
end

loop do
  puts 'hit or stay?'
  answer = gets.chomp.downcase
  break if answer == 'stay' || busted?
end

if busted?
  puts 'You busted!'
else
  puts 'You stayed!'
end

# onto the dealer
answer = ''
loop do
  break if answer == 'stay' || busted?
  # answer = dealer_decision method invoked here
end

if busted?
  puts 'Dealer busted!'
else
  puts 'Dealer stayed!'
end


