#include <iostream>
#include <queue>

class MedianFinder {
public:
    void addNum(int num) {
        small.push(num);
        large.push(-small.top());
        small.pop();
        if (large.size() > small.size()) {
            small.push(-large.top());
            large.pop();
        }
    }

    double findMedian() const {
        if (small.size() > large.size()) return small.top();
        return (small.top() + (-large.top())) / 2.0;
    }

private:
    std::priority_queue<int> small;
    std::priority_queue<int, std::vector<int>, std::greater<int>> large;
};

int main() {
    MedianFinder mf;
    for (int n : {5, 15, 1, 3}) mf.addNum(n);
    std::cout << mf.findMedian() << std::endl;
    return 0;
}
