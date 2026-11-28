#include <iostream>
#include <string>

int main() {
    int n = 8;
    for (int r = 0; r < n; r++) {
        std::cout << std::string(n - r - 1, ' ');
        for (int c = 0; c <= r; c++)
            std::cout << (((r & c) == c) ? "* " : "  ");
        std::cout << '\n';
    }
}
