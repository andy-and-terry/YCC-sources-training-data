enum Suit { hearts, spades, clubs, diamonds }

String color(Suit s) {
  switch (s) {
    case Suit.hearts:
    case Suit.diamonds:
      return 'red';
    case Suit.spades:
    case Suit.clubs:
      return 'black';
  }
}

void main() {
  for (final s in Suit.values) {
    print('$s: ${color(s)}');
  }
}
