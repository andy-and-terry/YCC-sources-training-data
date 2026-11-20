#include <iostream>
#include <optional>
#include <utility>
// Goldbach pair using std::optional.
bool isPrime(int n) { if (n < 2) return false; for (int d = 2; d * d <= n; d++) if (n % d == 0) return false; return true; }
std::optional<std::pair<int, int>> goldbach(int n) {
    for (int p = 2; p <= n / 2; p++) if (isPrime(p) && isPrime(n - p)) return std::make_pair(p, n - p);
    return std::nullopt;
}
int main() { if (auto r = goldbach(28)) std::cout << r->first << " + " << r->second << '\n'; }
