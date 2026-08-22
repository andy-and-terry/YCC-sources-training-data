#include <algorithm>
#include <iostream>
#include <vector>

std::vector<double> bucketSort(const std::vector<double>& items, int bucketCount) {
    if (items.empty()) return {};
    double lo = *std::min_element(items.begin(), items.end());
    double hi = *std::max_element(items.begin(), items.end());
    double span = (hi - lo == 0) ? 1 : hi - lo;
    std::vector<std::vector<double>> buckets(bucketCount);
    for (double x : items) {
        int idx = std::min(bucketCount - 1, static_cast<int>((x - lo) / span * bucketCount));
        buckets[idx].push_back(x);
    }
    std::vector<double> result;
    for (auto& bucket : buckets) {
        std::sort(bucket.begin(), bucket.end());
        result.insert(result.end(), bucket.begin(), bucket.end());
    }
    return result;
}

int main() {
    for (double x : bucketSort({0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51}, 10)) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
