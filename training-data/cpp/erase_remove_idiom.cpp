#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

template <typename C>
void print(const C& c) {
    for (const auto& x : c) std::cout << x << " ";
    std::cout << "\n";
}

int main() {
    std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8};

    v.erase(std::remove_if(v.begin(), v.end(), [](int x) { return x % 2 == 0; }), v.end());
    print(v);

    std::vector<int> d{1, 1, 2, 2, 2, 3, 1, 1};
    d.erase(std::unique(d.begin(), d.end()), d.end());
    print(d);

    std::string s = "a b  c   d";
    s.erase(std::remove(s.begin(), s.end(), ' '), s.end());
    std::cout << s << "\n";

    std::vector<int> w{5, 6, 7, 8, 9};
    std::erase_if(w, [](int x) { return x > 7; });
    print(w);
    return 0;
}
