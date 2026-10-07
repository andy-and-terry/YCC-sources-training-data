#include <iostream>
#include <vector>

std::vector<int> primeFactors(int n) {
    std::vector<int> factors;
    for (int divisor = 2; divisor * divisor <= n; divisor++) {
        while (n % divisor == 0) {
            factors.push_back(divisor);
            n /= divisor;
        }
    }
    if (n > 1) factors.push_back(n);
    return factors;
}

int main() {
    for (int f : primeFactors(360)) std::cout << f << " ";
    std::cout << std::endl;
    for (int f : primeFactors(97)) std::cout << f << " ";
    std::cout << std::endl;
    return 0;
}
