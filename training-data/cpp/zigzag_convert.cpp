#include <iostream>
#include <string>
#include <vector>

std::string zigzag(const std::string &s, int rows) {
    if (rows == 1 || rows >= static_cast<int>(s.size())) return s;
    std::vector<std::string> lines(rows);
    int r = 0, step = 1;
    for (char c : s) {
        lines[r] += c;
        if (r == 0) step = 1;
        else if (r == rows - 1) step = -1;
        r += step;
    }
    std::string out;
    for (auto &l : lines) out += l;
    return out;
}

int main() {
    std::cout << zigzag("PAYPALISHIRING", 3) << '\n';
}
