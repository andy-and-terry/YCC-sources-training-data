#include <iostream>
#include <string>
#include <vector>

std::string encode(const std::string& text, int rails) {
    std::vector<std::string> rows(rails);
    int r = 0, step = 1;
    for (char ch : text) {
        rows[r] += ch;
        if (r == 0) step = 1;
        else if (r == rails - 1) step = -1;
        r += step;
    }
    std::string out;
    for (auto& row : rows) out += row;
    return out;
}

int main() {
    std::cout << encode("WEAREDISCOVERED", 3) << '\n';
}
