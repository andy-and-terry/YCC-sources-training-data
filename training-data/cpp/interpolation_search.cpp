#include <iostream>
#include <vector>

long interpolation_search(const std::vector<long>& a, long target) {
    long lo = 0, hi = static_cast<long>(a.size()) - 1;
    while (lo <= hi && target >= a[lo] && target <= a[hi]) {
        if (a[hi] == a[lo]) return a[lo] == target ? lo : -1;
        long pos = lo + (target - a[lo]) * (hi - lo) / (a[hi] - a[lo]);
        if (a[pos] == target) return pos;
        if (a[pos] < target) lo = pos + 1;
        else hi = pos - 1;
    }
    return -1;
}

int main() {
    std::vector<long> a{10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47};
    std::cout << interpolation_search(a, 18) << ' ' << interpolation_search(a, 25) << '\n';
}
