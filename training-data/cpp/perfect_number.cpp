#include <iostream>
#include <map>
#include <string>
#include <vector>

enum class Kind { Perfect, Abundant, Deficient };

std::vector<long> divisor_sums(long limit) {
    std::vector<long> s(static_cast<std::size_t>(limit) + 1, 0);
    for (long d = 1; d <= limit / 2; ++d)
        for (long m = 2 * d; m <= limit; m += d) s[m] += d;
    return s;
}

int main() {
    const long limit = 100000;
    auto s = divisor_sums(limit);
    std::map<Kind, int> counts;
    std::vector<long> perfect;
    for (long n = 2; n <= limit; ++n) {
        Kind k = s[n] == n ? Kind::Perfect : s[n] > n ? Kind::Abundant : Kind::Deficient;
        ++counts[k];
        if (k == Kind::Perfect) perfect.push_back(n);
    }
    std::cout << "perfect:";
    for (long p : perfect) std::cout << ' ' << p;
    std::cout << "\nabundant=" << counts[Kind::Abundant] << " deficient=" << counts[Kind::Deficient] << '\n';
}
