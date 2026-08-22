#include <iostream>
#include <vector>

std::pair<double, double> fit(const std::vector<double>& xs, const std::vector<double>& ys) {
    double n = static_cast<double>(xs.size());
    double meanX = 0, meanY = 0;
    for (size_t i = 0; i < xs.size(); i++) {
        meanX += xs[i];
        meanY += ys[i];
    }
    meanX /= n;
    meanY /= n;

    double numerator = 0, denominator = 0;
    for (size_t i = 0; i < xs.size(); i++) {
        numerator += (xs[i] - meanX) * (ys[i] - meanY);
        denominator += (xs[i] - meanX) * (xs[i] - meanX);
    }
    double slope = numerator / denominator;
    double intercept = meanY - slope * meanX;
    return {slope, intercept};
}

double predict(double slope, double intercept, double x) {
    return slope * x + intercept;
}

int main() {
    std::vector<double> xs = {1, 2, 3, 4, 5};
    std::vector<double> ys = {2, 4, 5, 4, 5};
    auto [slope, intercept] = fit(xs, ys);
    std::cout << "y = " << slope << "x + " << intercept << std::endl;
    std::cout << predict(slope, intercept, 6) << std::endl;
    return 0;
}
