#include <iostream>
#include <string>

struct ConsoleLog {
    static void write(const std::string& m) { std::cout << "[console] " << m << "\n"; }
};
struct SilentLog {
    static void write(const std::string&) {}
};

struct CheckedDivide {
    static double apply(double a, double b) { return b == 0 ? 0 : a / b; }
};
struct RawDivide {
    static double apply(double a, double b) { return a / b; }
};

template <typename LogPolicy, typename DivPolicy>
class Calculator {
public:
    double divide(double a, double b) {
        LogPolicy::write("divide " + std::to_string(a) + " by " + std::to_string(b));
        return DivPolicy::apply(a, b);
    }
};

int main() {
    Calculator<ConsoleLog, CheckedDivide> safe;
    Calculator<SilentLog, RawDivide> fast;
    std::cout << safe.divide(1, 0) << "\n";
    std::cout << fast.divide(1, 0) << "\n";
}
