#include <iostream>
#include <span>
#include <vector>

int sum(std::span<const int> s) {
    int t = 0;
    for (int x : s) t += x;
    return t;
}

int main() {
    std::vector<int> v{1, 2, 3, 4, 5, 6};
    std::span<const int> all(v);
    std::cout << sum(all) << " " << sum(all.subspan(2, 3)) << " " << sum(all.first(2)) << "\n";
}
