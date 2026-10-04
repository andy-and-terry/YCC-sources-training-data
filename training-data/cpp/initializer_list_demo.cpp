#include <algorithm>
#include <initializer_list>
#include <iostream>
#include <vector>

int maxOf(std::initializer_list<int> values) {
    return *std::max_element(values.begin(), values.end());
}

class Polynomial {
    std::vector<int> coeffs;

public:
    Polynomial(std::initializer_list<int> c) : coeffs(c) {}

    int evaluate(int x) const {
        int result = 0;
        for (auto it = coeffs.rbegin(); it != coeffs.rend(); ++it) {
            result = result * x + *it;
        }
        return result;
    }
};

int main() {
    std::cout << maxOf({3, 9, 4, 1}) << "\n";
    Polynomial p{1, 2, 3};  // 1 + 2x + 3x^2
    std::cout << p.evaluate(2) << "\n";
    std::vector<int> v{5, 6, 7};
    std::vector<int> sized(5, 1);  // five ones, not {5, 1}
    std::cout << v.size() << " " << sized.size() << "\n";
    return 0;
}
