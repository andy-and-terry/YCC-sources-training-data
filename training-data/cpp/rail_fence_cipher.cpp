#include <algorithm>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>

std::vector<int> order(int n, int k) {
    auto rail = [k](int i) { int c = 2 * (k - 1), r = i % c; return r < k ? r : c - r; };
    std::vector<int> idx(n);
    std::iota(idx.begin(), idx.end(), 0);
    std::stable_sort(idx.begin(), idx.end(), [&](int a, int b) { return rail(a) < rail(b); });
    return idx;
}

std::string encrypt(const std::string& t, int k) {
    std::string out;
    for (int i : order(t.size(), k)) out += t[i];
    return out;
}

std::string decrypt(const std::string& c, int k) {
    std::string out(c.size(), ' ');
    auto idx = order(c.size(), k);
    for (size_t pos = 0; pos < idx.size(); ++pos) out[idx[pos]] = c[pos];
    return out;
}

int main() {
    auto c = encrypt("WEAREDISCOVERED", 3);
    std::cout << c << " " << decrypt(c, 3) << "\n";
}
