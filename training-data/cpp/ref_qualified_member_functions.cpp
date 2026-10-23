#include <iostream>
#include <string>
#include <utility>

class Name {
    std::string value_;
public:
    explicit Name(std::string v) : value_(std::move(v)) {}
    const std::string& get() const& { std::cout << "[lvalue] "; return value_; }
    std::string get() && { std::cout << "[rvalue] "; return std::move(value_); }
};

Name make() { return Name("temporary"); }

int main() {
    Name n("persistent");
    std::cout << n.get() << "\n";
    std::cout << make().get() << "\n";
    std::cout << std::move(n).get() << "\n";
}
