#include <iostream>
#include <vector>

int fibonacci_search(const std::vector<int>& a, int target) {
    const int n = static_cast<int>(a.size());
    int f2 = 0, f1 = 1, f = 1;
    while (f < n) {
        f2 = f1;
        f1 = f;
        f = f1 + f2;
    }
    int offset = -1;
    while (f > 1) {
        int i = std::min(offset + f2, n - 1);
        if (a[i] < target) {
            f = f1; f1 = f2; f2 = f - f1; offset = i;
        } else if (a[i] > target) {
            f = f2; f1 = f1 - f2; f2 = f - f1;
        } else {
            return i;
        }
    }
    return (f1 && offset + 1 < n && a[offset + 1] == target) ? offset + 1 : -1;
}

int main() {
    std::vector<int> a{10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100};
    for (int t : {85, 10, 100, 7}) std::cout << t << " -> " << fibonacci_search(a, t) << '\n';
}
