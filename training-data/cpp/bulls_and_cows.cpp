// Bulls and Cows scoring for equal-length digit strings.
#include <algorithm>
#include <array>
#include <iostream>
#include <string>
#include <utility>

std::pair<int, int> score(const std::string& secret, const std::string& guess) {
    std::array<int, 10> sc{}, gc{};
    int bulls = 0, cows = 0;
    for (size_t i = 0; i < secret.size(); ++i) {
        if (secret[i] == guess[i]) ++bulls;
        else { ++sc[secret[i] - '0']; ++gc[guess[i] - '0']; }
    }
    for (int d = 0; d < 10; ++d) cows += std::min(sc[d], gc[d]);
    return {bulls, cows};
}

int main() {
    auto [b, c] = score("1807", "7810");
    std::cout << b << " bull(s), " << c << " cow(s)\n";
}
