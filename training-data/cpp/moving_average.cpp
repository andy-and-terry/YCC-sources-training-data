#include <deque>
#include <iomanip>
#include <iostream>

class MovingAverage {
public:
    explicit MovingAverage(size_t size) : size_(size) {}

    double next(double v) {
        window_.push_back(v);
        sum_ += v;
        if (window_.size() > size_) {
            sum_ -= window_.front();
            window_.pop_front();
        }
        return sum_ / static_cast<double>(window_.size());
    }

private:
    size_t size_;
    std::deque<double> window_;
    double sum_ = 0;
};

int main() {
    MovingAverage ma(3);
    std::cout << std::fixed << std::setprecision(2);
    for (double v : {1.0, 10.0, 3.0, 5.0, 8.0, 2.0}) std::cout << ma.next(v) << ' ';
    std::cout << '\n';
}
