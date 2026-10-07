#include <iostream>

int main() {
    long n = 27;
    int steps = 0;

    std::cout << n;
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        std::cout << " " << n;
        steps++;
    }
    std::cout << std::endl << "steps: " << steps << std::endl;
    return 0;
}
