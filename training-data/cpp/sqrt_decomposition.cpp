#include <iostream>
#include <vector>

class SqrtSum {
    std::vector<int> a, blk; int bs;
public:
    SqrtSum(std::vector<int> v, int block) : a(std::move(v)), blk((a.size() + block - 1) / block), bs(block) {
        for (size_t i = 0; i < a.size(); i++) blk[i / bs] += a[i];
    }
    int query(int l, int r) const {
        int s = 0;
        for (int i = l; i <= r;) {
            if (i % bs == 0 && i + bs - 1 <= r) { s += blk[i / bs]; i += bs; }
            else s += a[i++];
        }
        return s;
    }
};

int main() {
    SqrtSum t({5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5}, 4);
    std::cout << t.query(2, 9) << '\n';
}
