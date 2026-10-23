#include <iostream>
#include <vector>

// Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), Q(1) = Q(2) = 1
std::vector<int> hofstadterQ(int count) {
    std::vector<int> q(count + 1, 0);
    q[1] = q[2] = 1;
    for (int n = 3; n <= count; ++n) q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
    return std::vector<int>(q.begin() + 1, q.end());
}

int main() {
    for (int v : hofstadterQ(20)) std::cout << v << ' ';
    std::cout << '\n';
}
