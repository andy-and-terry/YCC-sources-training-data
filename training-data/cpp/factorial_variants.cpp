#include <iostream>
#include <numeric>
#include <vector>

unsigned long long factorialRecursive(int n) {
    return n <= 1 ? 1 : n * factorialRecursive(n - 1);
}

unsigned long long factorialIterative(int n) {
    unsigned long long result = 1;
    for (int i = 2; i <= n; i++) result *= i;
    return result;
}

int main() {
    std::cout << factorialRecursive(5) << " " << factorialIterative(5) << std::endl;
    return 0;
}
