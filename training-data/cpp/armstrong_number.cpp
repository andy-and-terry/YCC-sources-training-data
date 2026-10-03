#include <iostream>
#include <cmath>

bool isArmstrong(int n) {
    int digits = static_cast<int>(std::log10(n)) + 1;
    int sum = 0, temp = n;
    while (temp > 0) {
        int d = temp % 10;
        sum += static_cast<int>(std::pow(d, digits));
        temp /= 10;
    }
    return sum == n;
}

int main() {
    for (int n = 1; n <= 1000; n++) {
        if (isArmstrong(n)) std::cout << n << " ";
    }
    std::cout << std::endl;
    return 0;
}
