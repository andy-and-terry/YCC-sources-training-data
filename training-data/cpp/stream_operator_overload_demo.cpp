#include <iostream>
#include <sstream>

class Fraction {
public:
    Fraction(int num, int den) : num_(num), den_(den) {}

    friend std::ostream& operator<<(std::ostream& os, const Fraction& f) {
        return os << f.num_ << "/" << f.den_;
    }

    friend std::istream& operator>>(std::istream& is, Fraction& f) {
        char slash;
        return is >> f.num_ >> slash >> f.den_;
    }

private:
    int num_, den_;
};

int main() {
    Fraction half(1, 2);
    std::cout << half << std::endl;

    std::istringstream input("3/4");
    Fraction threeQuarters(0, 1);
    input >> threeQuarters;
    std::cout << threeQuarters << std::endl;
    return 0;
}
