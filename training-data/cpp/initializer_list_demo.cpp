#include <initializer_list>
#include <iostream>
#include <string>
#include <vector>

class Polynomial {
    std::vector<int> coef_;
public:
    Polynomial(std::initializer_list<int> c) : coef_(c) {}
    long eval(int x) const {
        long result = 0;
        for (auto it = coef_.rbegin(); it != coef_.rend(); ++it) result = result * x + *it;
        return result;
    }
};

int max_of(std::initializer_list<int> xs) {
    int m = *xs.begin();
    for (int x : xs) if (x > m) m = x;
    return m;
}

int main() {
    Polynomial p{1, 2, 3};  // 1 + 2x + 3x^2
    std::cout << p.eval(2) << "\n";
    std::cout << max_of({3, 9, 4}) << "\n";
    std::vector<std::string> names{"a", "b", "c"};
    std::cout << names.size() << "\n";
}
