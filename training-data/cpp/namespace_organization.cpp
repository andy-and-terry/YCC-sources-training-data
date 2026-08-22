#include <iostream>

namespace math_utils {
    namespace geometry {
        double circleArea(double radius) { return 3.14159265 * radius * radius; }
    }

    namespace stats {
        double average(const double* values, int count) {
            double sum = 0;
            for (int i = 0; i < count; i++) sum += values[i];
            return sum / count;
        }
    }
}

int main() {
    using namespace math_utils;
    std::cout << geometry::circleArea(2.0) << std::endl;
    double data[] = {1.0, 2.0, 3.0, 4.0};
    std::cout << stats::average(data, 4) << std::endl;
    return 0;
}
