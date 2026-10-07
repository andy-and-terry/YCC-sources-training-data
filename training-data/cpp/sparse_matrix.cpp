#include <iostream>
#include <map>
#include <utility>

class SparseMatrix {
public:
    SparseMatrix(int rows, int cols) : rows_(rows), cols_(cols) {}

    void set(int r, int c, double v) {
        if (v == 0) data_.erase({r, c});
        else data_[{r, c}] = v;
    }

    double get(int r, int c) const {
        auto it = data_.find({r, c});
        return it == data_.end() ? 0 : it->second;
    }

    SparseMatrix operator*(const SparseMatrix& o) const {
        SparseMatrix out(rows_, o.cols_);
        for (const auto& [rc, v] : data_) {
            auto [r, k] = rc;
            for (auto it = o.data_.lower_bound({k, 0}); it != o.data_.end() && it->first.first == k; ++it)
                out.set(r, it->first.second, out.get(r, it->first.second) + v * it->second);
        }
        return out;
    }

    SparseMatrix transpose() const {
        SparseMatrix t(cols_, rows_);
        for (const auto& [rc, v] : data_) t.set(rc.second, rc.first, v);
        return t;
    }

    friend std::ostream& operator<<(std::ostream& os, const SparseMatrix& m) {
        for (int r = 0; r < m.rows_; ++r) {
            for (int c = 0; c < m.cols_; ++c) os << m.get(r, c) << '\t';
            os << '\n';
        }
        return os;
    }

private:
    int rows_, cols_;
    std::map<std::pair<int, int>, double> data_;
};

int main() {
    SparseMatrix a(3, 3), b(3, 3);
    a.set(0, 0, 1), a.set(1, 2, 2), a.set(2, 1, 3);
    b.set(0, 1, 4), b.set(1, 0, 5), b.set(2, 2, 6);
    std::cout << a * b << '\n' << a.transpose();
}
