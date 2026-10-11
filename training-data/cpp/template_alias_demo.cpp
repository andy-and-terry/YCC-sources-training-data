#include <iostream>
#include <map>
#include <string>
#include <vector>

template <typename T>
using Grid = std::vector<std::vector<T>>;

template <typename V>
using StrMap = std::map<std::string, V>;

template <typename T>
using Callback = void (*)(const T&);

template <typename T>
void print_grid(const Grid<T>& g) {
    for (auto& row : g) {
        for (auto& x : row) std::cout << x << ' ';
        std::cout << "\n";
    }
}

void show_int(const int& x) { std::cout << "int " << x << "\n"; }

int main() {
    Grid<int> g(2, std::vector<int>(3, 7));
    g[1][2] = 0;
    print_grid(g);
    StrMap<double> prices{{"tea", 2.5}, {"jam", 4.0}};
    for (auto& [k, v] : prices) std::cout << k << "=" << v << "\n";
    Callback<int> cb = show_int;
    cb(5);
}
