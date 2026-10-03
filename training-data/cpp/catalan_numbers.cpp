#include <iostream>
#include <vector>

std::vector<long long> catalanNumbers(int n) {
    std::vector<long long> catalan(n + 1, 0);
    catalan[0] = 1;
    for (int i = 1; i <= n; i++) {
        for (int j = 0; j < i; j++) {
            catalan[i] += catalan[j] * catalan[i - 1 - j];
        }
    }
    return catalan;
}

int main() {
    for (long long c : catalanNumbers(10)) {
        std::cout << c << " ";
    }
    std::cout << std::endl;
    return 0;
}
