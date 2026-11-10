#include <iostream>

constexpr int pieces(int cuts) { return (cuts * cuts + cuts + 2) / 2; }

int main() {
    static_assert(pieces(4) == 11, "four cuts make eleven pieces");
    for (int n = 0; n < 10; ++n) std::cout << pieces(n) << ' ';
    std::cout << '\n';  // 1 2 4 7 11 16 22 29 37 46
}
