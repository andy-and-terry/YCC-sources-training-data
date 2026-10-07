#include <algorithm>
#include <functional>
#include <iostream>
#include <string>
#include <vector>

// Hand-rolled Horspool, cross-checked with std::boyer_moore_horspool_searcher.
std::vector<std::size_t> horspool(const std::string& text, const std::string& pat) {
    std::vector<std::size_t> out;
    const std::size_t m = pat.size(), n = text.size();
    if (m == 0 || m > n) return out;
    std::vector<std::size_t> shift(256, m);
    for (std::size_t i = 0; i + 1 < m; ++i) shift[static_cast<unsigned char>(pat[i])] = m - 1 - i;
    for (std::size_t i = 0; i <= n - m; i += shift[static_cast<unsigned char>(text[i + m - 1])])
        if (text.compare(i, m, pat) == 0) out.push_back(i);
    return out;
}

int main() {
    std::string text = "here is a simple example, an example indeed", pat = "example";
    for (auto p : horspool(text, pat)) std::cout << p << ' ';
    std::cout << '\n';
    std::boyer_moore_horspool_searcher searcher(pat.begin(), pat.end());
    auto it = std::search(text.begin(), text.end(), searcher);
    std::cout << "std searcher first match: " << (it - text.begin()) << '\n';
}
