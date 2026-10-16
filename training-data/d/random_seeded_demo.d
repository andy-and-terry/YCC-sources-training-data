import std.stdio;
import std.random;

void main() {
    auto rng = Random(42);
    foreach (_; 0 .. 5)
        write(uniform(1, 7, rng), " ");
    writeln();
    auto deck = [1, 2, 3, 4, 5, 6];
    randomShuffle(deck, rng);
    writeln(deck.length);
}
