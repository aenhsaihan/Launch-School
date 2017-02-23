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

def calculate_ace(hand)
  total = 0
  hand.each do |card|
    total += card.last.to_i
  end

  total < 15 ? 11 : 1
end
