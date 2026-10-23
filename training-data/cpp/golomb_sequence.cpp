#include <iostream>
#include <vector>

// a(n) = 1 + a(n - a(a(n-1))), 1-based indexing
std::vector<int> golomb(int count) {
    std::vector<int> a(count + 1, 0);
    a[1] = 1;
    for (int n = 2; n <= count; ++n) a[n] = 1 + a[n - a[a[n - 1]]];
    return std::vector<int>(a.begin() + 1, a.end());
}

int main() {
    for (int v : golomb(20)) std::cout << v << ' ';
    std::cout << '\n';
}
