#include <functional>
#include <iostream>
#include <map>
#include <string>

int twice(int x) { return 2 * x; }
struct Scale { int k; int operator()(int x) const { return k * x; } };

int main() {
    std::map<std::string, std::function<int(int)>> ops;
    ops["twice"] = twice;
    ops["scale3"] = Scale{3};
    ops["square"] = [](int x) { return x * x; };
    ops["plus1"] = std::bind(std::plus<int>(), std::placeholders::_1, 1);
    for (const auto &[name, fn] : ops)
        std::cout << name << "(7) = " << fn(7) << "\n";

    std::function<int(int)> fact = [&](int n) { return n <= 1 ? 1 : n * fact(n - 1); };
    std::cout << "5! = " << fact(5) << "\n";
}
