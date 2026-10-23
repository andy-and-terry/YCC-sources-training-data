#include <algorithm>
#include <iostream>
#include <iterator>
#include <numeric>
#include <random>
#include <vector>

// std::shuffle and std::sample with a fixed seed give reproducible output
template <typename C>
void show(const char* label, const C& c) {
    std::cout << label << ": ";
    for (const auto& x : c) std::cout << x << ' ';
    std::cout << '\n';
}

int main() {
    std::vector<int> deck(10);
    std::iota(deck.begin(), deck.end(), 1);
    show("original", deck);

    std::mt19937 rng(12345);
    std::shuffle(deck.begin(), deck.end(), rng);
    std::cout << "shuffled has same size: " << deck.size() << '\n';

    // draw 3 distinct elements without replacement
    std::vector<int> hand;
    std::sample(deck.begin(), deck.end(), std::back_inserter(hand), 3, rng);
    std::cout << "hand size: " << hand.size() << '\n';

    // sorted again, the multiset of values is unchanged
    std::sort(deck.begin(), deck.end());
    show("sorted", deck);

    // same seed -> same sequence
    std::mt19937 a(7), b(7);
    std::uniform_int_distribution<int> d(1, 100);
    bool same = true;
    for (int i = 0; i < 5; ++i) same = same && (d(a) == d(b));
    std::cout << "same seed reproduces: " << std::boolalpha << same << '\n';
    return 0;
}
