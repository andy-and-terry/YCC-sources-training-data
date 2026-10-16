#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> v(6);
    std::iota(v.begin(), v.end(), 10);
    for (int x : v) std::cout << x << ' ';
    std::cout << "\n";

    int a = 1, b = 1;
    std::vector<int> fib(10);
    std::generate(fib.begin(), fib.end(), [&] { int r = a; a = b; b += r; return r; });
    for (int x : fib) std::cout << x << ' ';
    std::cout << "\n";

    std::vector<int> idx(5);
    std::iota(idx.begin(), idx.end(), 0);
    std::vector<char> letters{'d', 'b', 'e', 'a', 'c'};
    std::sort(idx.begin(), idx.end(), [&](int i, int j) { return letters[i] < letters[j]; });
    for (int i : idx) std::cout << i << ' ';
    std::cout << "\n";
}
