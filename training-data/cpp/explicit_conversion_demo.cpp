#include <iostream>
#include <string>

class Celsius {
    double v_;
public:
    explicit Celsius(double v) : v_(v) {}
    explicit operator double() const { return v_; }
    explicit operator bool() const { return v_ > 0; }
    operator std::string() const { return std::to_string(v_) + "C"; }
};

void print_temp(const std::string& s) { std::cout << s << "\n"; }
void takes_celsius(Celsius c) { std::cout << static_cast<double>(c) << "\n"; }

int main() {
    Celsius c(21.5);
    print_temp(c);
    takes_celsius(Celsius(3));
    // takes_celsius(3);   // error: constructor is explicit
    if (c) std::cout << "above freezing\n";
    double d = static_cast<double>(c);
    std::cout << d * 2 << "\n";
}
