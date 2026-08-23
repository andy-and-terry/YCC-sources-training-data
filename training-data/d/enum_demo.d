import std.stdio;

enum Suit { Hearts, Spades, Clubs, Diamonds }

string color(Suit s) {
    final switch (s) {
        case Suit.Hearts:
        case Suit.Diamonds:
            return "red";
        case Suit.Spades:
        case Suit.Clubs:
            return "black";
    }
}

void main() {
    foreach (s; [Suit.Hearts, Suit.Spades, Suit.Clubs, Suit.Diamonds]) {
        writeln(s, ": ", color(s));
    }
}
