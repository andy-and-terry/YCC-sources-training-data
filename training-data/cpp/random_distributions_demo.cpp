#include <iostream>
#include <map>
#include <random>

int main() {
    std::mt19937 rng(12345);  // fixed seed for reproducibility
    std::uniform_int_distribution<int> die(1, 6);
    std::map<int, int> hist;
    for (int i = 0; i < 6000; ++i) ++hist[die(rng)];
    for (auto& [face, n] : hist) std::cout << face << ": " << (n > 800 && n < 1200 ? "balanced" : "skewed") << "\n";

    std::normal_distribution<double> nd(0.0, 1.0);
    double sum = 0;
    for (int i = 0; i < 10000; ++i) sum += nd(rng);
    std::cout << "mean near 0: " << (std::abs(sum / 10000) < 0.05) << "\n";

    std::bernoulli_distribution coin(0.3);
    int heads = 0;
    for (int i = 0; i < 10000; ++i) heads += coin(rng);
    std::cout << "p near 0.3: " << (heads > 2800 && heads < 3200) << "\n";
}
