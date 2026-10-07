#include <iostream>
#include <unordered_map>

std::unordered_map<unsigned long long, int> cache;

int collatzSteps(unsigned long long n) {
    if (n == 1) return 0;
    auto it = cache.find(n);
    if (it != cache.end()) return it->second;
    int steps = 1 + collatzSteps(n % 2 == 0 ? n / 2 : 3 * n + 1);
    cache[n] = steps;
    return steps;
}

int main() {
    unsigned long long best = 1;
    int bestSteps = 0;
    for (unsigned long long i = 1; i < 10000; i++) {
        int s = collatzSteps(i);
        if (s > bestSteps) {
            bestSteps = s;
            best = i;
        }
    }
    std::cout << "27 takes " << collatzSteps(27) << " steps\n";
    std::cout << "longest under 10000: " << best << " (" << bestSteps << " steps)\n";
    return 0;
}
