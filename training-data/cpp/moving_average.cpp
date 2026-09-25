#include <deque>
#include <iomanip>
#include <iostream>
#include <vector>

// Sliding window keeping mean and median-free min/max via monotonic deques.
class Window {
public:
    explicit Window(std::size_t k) : k_(k) {}

    void push(double x) {
        vals_.push_back(x);
        sum_ += x;
        while (!mx_.empty() && mx_.back() < x) mx_.pop_back();
        while (!mn_.empty() && mn_.back() > x) mn_.pop_back();
        mx_.push_back(x);
        mn_.push_back(x);
        if (vals_.size() > k_) {
            double old = vals_.front();
            vals_.pop_front();
            sum_ -= old;
            if (mx_.front() == old) mx_.pop_front();
            if (mn_.front() == old) mn_.pop_front();
        }
    }

    double mean() const { return sum_ / static_cast<double>(vals_.size()); }
    double max() const { return mx_.front(); }
    double min() const { return mn_.front(); }

private:
    std::size_t k_;
    std::deque<double> vals_, mx_, mn_;
    double sum_ = 0;
};

int main() {
    Window w(3);
    std::cout << std::fixed << std::setprecision(3);
    for (double p : {10, 11, 12, 13, 12, 11, 15, 18, 17, 16}) {
        w.push(p);
        std::cout << p << "  mean=" << w.mean() << " min=" << w.min() << " max=" << w.max() << '\n';
    }
}
