#include <algorithm>
#include <cmath>
#include <iostream>
#include <numeric>
#include <vector>

double mean(const std::vector<double>& values) {
    return std::accumulate(values.begin(), values.end(), 0.0) / values.size();
}

double median(std::vector<double> values) {
    std::sort(values.begin(), values.end());
    size_t n = values.size();
    return n % 2 == 0 ? (values[n / 2 - 1] + values[n / 2]) / 2 : values[n / 2];
}

double variance(const std::vector<double>& values) {
    double m = mean(values);
    double sum = 0;
    for (double v : values) sum += (v - m) * (v - m);
    return sum / values.size();
}

double stdev(const std::vector<double>& values) {
    return std::sqrt(variance(values));
}

int main() {
    std::vector<double> data = {2, 4, 4, 4, 5, 5, 7, 9};
    std::cout << mean(data) << " " << median(data) << " " << stdev(data) << std::endl;
    return 0;
}
