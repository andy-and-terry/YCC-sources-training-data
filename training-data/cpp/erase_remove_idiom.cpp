#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8};
    v.erase(std::remove_if(v.begin(), v.end(), [](int x) { return x % 2 == 0; }), v.end());
    for (int x : v) std::cout << x << " ";
    std::cout << "\n";

    std::vector<int> w{3, 1, 3, 2, 1};
    std::sort(w.begin(), w.end());
    w.erase(std::unique(w.begin(), w.end()), w.end());
    for (int x : w) std::cout << x << " ";
    std::cout << "\n";

    std::vector<int> z{1, 2, 3, 4, 5, 6};
    std::erase_if(z, [](int x) { return x > 3; });  // C++20
    std::cout << z.size() << "\n";

    std::string s = "a b  c";
    s.erase(std::remove(s.begin(), s.end(), ' '), s.end());
    std::cout << s << "\n";
}
