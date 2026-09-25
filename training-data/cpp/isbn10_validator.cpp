#include <iostream>
#include <string>

bool isValidIsbn10(const std::string& isbn) {
    int total = 0, pos = 0;
    for (char c : isbn) {
        if (c == '-') continue;
        int v;
        if (c >= '0' && c <= '9') v = c - '0';
        else if (c == 'X' && pos == 9) v = 10;
        else return false;
        if (pos >= 10) return false;
        total += v * (10 - pos++);
    }
    return pos == 10 && total % 11 == 0;
}

int main() {
    for (auto s : {"3-598-21508-8", "3-598-21507-X", "3-598-21508-9"})
        std::cout << s << ' ' << std::boolalpha << isValidIsbn10(s) << '\n';
}
