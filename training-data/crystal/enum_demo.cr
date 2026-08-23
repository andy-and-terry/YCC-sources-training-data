enum Suit
  Hearts
  Spades
  Clubs
  Diamonds
end

def color(suit : Suit) : String
  case suit
  when Suit::Hearts, Suit::Diamonds
    "red"
  else
    "black"
  end
end

Suit.each do |suit|
  puts "#{suit}: #{color(suit)}"
end
