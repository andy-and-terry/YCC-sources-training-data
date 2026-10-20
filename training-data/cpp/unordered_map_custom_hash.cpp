#include <functional>
#include <iostream>
#include <unordered_map>

struct P { int x, y; bool operator==(const P& o) const { return x == o.x && y == o.y; } };
struct PH { size_t operator()(const P& p) const { return std::hash<int>()(p.x) * 31 + std::hash<int>()(p.y); } };

int main() {
    std::unordered_map<P, std::string, PH> m;
    m[{1, 2}] = "a"; m[{3, 4}] = "b";
    std::cout << m.at({3, 4}) << m.count({9, 9}) << "\n";
}
