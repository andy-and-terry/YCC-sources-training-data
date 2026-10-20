#include <iostream>
#include <random>
#include <vector>

int main() {
    std::mt19937 rng(42);
    std::uniform_int_distribution<int> die(1, 6);
    std::normal_distribution<double> nd(0, 1);
    std::vector<int> counts(7);
    for (int i = 0; i < 6000; i++) counts[die(rng)]++;
    bool fair = true;
    for (int i = 1; i <= 6; i++) fair &= counts[i] > 800 && counts[i] < 1200;
    std::cout << fair << (std::abs(nd(rng)) < 10) << "\n";
}
