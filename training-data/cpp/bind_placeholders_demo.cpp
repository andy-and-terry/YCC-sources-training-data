#include <functional>
#include <iostream>
#include <string>

int volume(int w, int h, int d) { return w * h * d; }

struct Greeter {
    std::string greeting;
    std::string greet(const std::string& name) const { return greeting + ", " + name; }
};

int main() {
    using namespace std::placeholders;
    auto fixed_height = std::bind(volume, _1, 10, _2);
    std::cout << fixed_height(2, 3) << "\n";

    auto swapped = std::bind(volume, _3, _2, _1);
    std::cout << swapped(1, 2, 3) << "\n";

    Greeter g{"Hello"};
    auto hi = std::bind(&Greeter::greet, &g, _1);
    std::cout << hi("world") << "\n";

    std::function<std::string(const Greeter&, const std::string&)> f = &Greeter::greet;
    std::cout << f(g, "again") << "\n";
}
