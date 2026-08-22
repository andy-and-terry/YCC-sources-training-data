#include <iostream>

class Fraction {
public:
    Fraction(int num, int den) : num(num), den(den) {}

    Fraction operator+(const Fraction& other) const {
        return Fraction(num * other.den + other.num * den, den * other.den);
    }

    Fraction operator*(const Fraction& other) const {
        return Fraction(num * other.num, den * other.den);
    }

    bool operator==(const Fraction& other) const {
        return num * other.den == other.num * den;
    }

    friend std::ostream& operator<<(std::ostream& os, const Fraction& f) {
        return os << f.num << "/" << f.den;
    }

private:
    int num, den;
};

int main() {
    Fraction a(1, 2), b(1, 3);
    std::cout << (a + b) << std::endl;
    std::cout << (a * b) << std::endl;
    std::cout << (Fraction(2, 4) == Fraction(1, 2)) << std::endl;
    return 0;
}
