#include <cstdint>
#include <iostream>
#include <string>
#include <vector>

std::vector<std::uint64_t> catalan(int n) {
    std::vector<std::uint64_t> c(static_cast<std::size_t>(n) + 1, 0);
    c[0] = 1;
    for (int i = 1; i <= n; ++i)
        for (int j = 0; j < i; ++j) c[i] += c[j] * c[i - 1 - j];
    return c;
}

// Enumerates all full binary tree shapes with n internal nodes (Catalan(n) of them).
std::vector<std::string> trees(int n) {
    if (n == 0) return {"."};
    std::vector<std::string> out;
    for (int l = 0; l < n; ++l)
        for (const auto& a : trees(l))
            for (const auto& b : trees(n - 1 - l)) out.push_back("(" + a + b + ")");
    return out;
}

int main() {
    auto c = catalan(30);
    for (int i = 0; i <= 30; i += 5) std::cout << "C(" << i << ") = " << c[i] << '\n';
    for (const auto& t : trees(3)) std::cout << t << ' ';
    std::cout << "\ncount(4) = " << trees(4).size() << " expected " << c[4] << '\n';
}
