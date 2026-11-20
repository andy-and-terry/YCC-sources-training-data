#include <iostream>
#include <vector>
// Lattice paths with a rolling DP row.
long long lattice(int n) {
    std::vector<long long> row(n + 1, 1);
    for (int k = 0; k < n; k++) for (int j = 1; j <= n; j++) row[j] += row[j - 1];
    return row[n];
}
int main() { std::cout << lattice(3) << '\n'; }
