#include <iostream>
#include <string>

std::string ordinal(int n) {
    int r100 = n % 100, r10 = n % 10;
    const char *s = (r100 >= 11 && r100 <= 13) ? "th"
                    : r10 == 1 ? "st" : r10 == 2 ? "nd" : r10 == 3 ? "rd" : "th";
    return std::to_string(n) + s;
}

int main() {
    for (int n : {1, 2, 3, 4, 11, 12, 13, 21, 101, 111}) std::cout << ordinal(n) << ' ';
    std::cout << '\n';
}
