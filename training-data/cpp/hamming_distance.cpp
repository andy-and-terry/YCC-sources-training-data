#include <iostream>
#include <numeric>
#include <stdexcept>
#include <string>

std::size_t hamming(const std::string& a, const std::string& b) {
    if (a.size() != b.size()) throw std::invalid_argument("strands must be of equal length");
    return std::inner_product(a.begin(), a.end(), b.begin(), std::size_t{0}, std::plus<>(),
                              [](char x, char y) { return x != y ? 1u : 0u; });
}

int main() {
    std::cout << hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT") << '\n';
    try { hamming("AB", "A"); } catch (const std::exception& e) { std::cout << e.what() << '\n'; }
}
