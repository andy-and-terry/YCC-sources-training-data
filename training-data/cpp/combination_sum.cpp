#include <algorithm>
#include <iostream>
#include <vector>

class CombinationSum {
public:
    static std::vector<std::vector<int>> solve(std::vector<int> candidates, int target) {
        std::sort(candidates.begin(), candidates.end());
        CombinationSum cs{candidates};
        cs.backtrack(0, target);
        return cs.out_;
    }

private:
    explicit CombinationSum(std::vector<int> c) : c_(std::move(c)) {}

    void backtrack(std::size_t start, int remaining) {
        if (remaining == 0) {
            out_.push_back(path_);
            return;
        }
        for (std::size_t i = start; i < c_.size() && c_[i] <= remaining; ++i) {
            path_.push_back(c_[i]);
            backtrack(i, remaining - c_[i]);
            path_.pop_back();
        }
    }

    std::vector<int> c_, path_;
    std::vector<std::vector<int>> out_;
};

int main() {
    for (auto [cands, target] : {std::pair{std::vector<int>{2, 3, 6, 7}, 7}, {std::vector<int>{2, 3, 5}, 8}}) {
        for (const auto& combo : CombinationSum::solve(cands, target)) {
            std::cout << '[';
            for (std::size_t i = 0; i < combo.size(); ++i) std::cout << (i ? "," : "") << combo[i];
            std::cout << "] ";
        }
        std::cout << '\n';
    }
}
