#include <iostream>
#include <string>
#include <vector>

struct Tracer {
    std::string n;
    Tracer(std::string s) : n(std::move(s)) {}
    Tracer(const Tracer& o) : n(o.n) { std::cout << "copy " << n << "\n"; }
    Tracer(Tracer&& o) noexcept : n(std::move(o.n)) { std::cout << "move\n"; }
};

int main() {
    std::vector<Tracer> v;
    v.reserve(2);
    Tracer t("x");
    v.push_back(t);
    v.push_back(std::move(t));
    v.emplace_back("y");
}
