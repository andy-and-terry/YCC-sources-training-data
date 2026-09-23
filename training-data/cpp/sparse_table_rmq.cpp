#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>

class SparseTable {
public:
    explicit SparseTable(const std::vector<int>& data) {
        int n = static_cast<int>(data.size());
        int levels = static_cast<int>(std::log2(n)) + 1;
        table.assign(levels, std::vector<int>(n));
        table[0] = data;

        for (int k = 1; k < levels; k++) {
            int span = 1 << k;
            for (int i = 0; i + span <= n; i++) {
                table[k][i] = std::min(table[k - 1][i], table[k - 1][i + span / 2]);
            }
        }
    }

    int queryMin(int left, int right) const {
        int length = right - left + 1;
        int k = static_cast<int>(std::log2(length));
        return std::min(table[k][left], table[k][right - (1 << k) + 1]);
    }

private:
    std::vector<std::vector<int>> table;
};

int main() {
    std::vector<int> data{5, 2, 4, 7, 1, 3, 9, 6};
    SparseTable table(data);

    std::cout << table.queryMin(0, 3) << std::endl;
    std::cout << table.queryMin(2, 6) << std::endl;
    std::cout << table.queryMin(4, 7) << std::endl;
    return 0;
}
