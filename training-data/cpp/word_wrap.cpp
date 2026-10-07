#include <iomanip>
#include <iostream>
#include <limits>
#include <sstream>
#include <string>
#include <vector>

// Minimum-raggedness wrap (Knuth-Plass style cost = squared slack, last line free).
std::vector<std::string> wrap(const std::vector<std::string>& words, int width) {
    const int n = static_cast<int>(words.size());
    std::vector<long> cost(n + 1, std::numeric_limits<long>::max());
    std::vector<int> brk(n + 1, n);
    cost[n] = 0;
    for (int i = n - 1; i >= 0; --i) {
        int len = -1;
        for (int j = i; j < n; ++j) {
            len += static_cast<int>(words[j].size()) + 1;
            if (len > width) break;
            long slack = j == n - 1 ? 0 : static_cast<long>(width - len) * (width - len);
            if (cost[j + 1] != std::numeric_limits<long>::max() && slack + cost[j + 1] < cost[i]) {
                cost[i] = slack + cost[j + 1];
                brk[i] = j + 1;
            }
        }
    }
    std::vector<std::string> lines;
    for (int i = 0; i < n; i = brk[i]) {
        std::string line;
        for (int k = i; k < brk[i]; ++k) line += (k > i ? " " : "") + words[k];
        lines.push_back(line);
    }
    return lines;
}

int main() {
    std::istringstream in("aaa bb cc ddddd the quick brown fox jumps over the lazy dog");
    std::vector<std::string> words;
    for (std::string w; in >> w;) words.push_back(w);
    for (const auto& l : wrap(words, 16)) std::cout << '|' << std::left << std::setw(16) << l << "|\n";
}
