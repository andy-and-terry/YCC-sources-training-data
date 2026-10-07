#include <iostream>
#include <vector>
#include <stdexcept>

class MinHeap {
public:
    void push(int value) {
        data_.push_back(value);
        siftUp(static_cast<int>(data_.size()) - 1);
    }

    int pop() {
        if (data_.empty()) throw std::runtime_error("heap is empty");
        int top = data_.front();
        data_.front() = data_.back();
        data_.pop_back();
        if (!data_.empty()) siftDown(0);
        return top;
    }

    bool empty() const { return data_.empty(); }

private:
    std::vector<int> data_;

    void siftUp(int i) {
        while (i > 0) {
            int parent = (i - 1) / 2;
            if (data_[parent] <= data_[i]) break;
            std::swap(data_[parent], data_[i]);
            i = parent;
        }
    }

    void siftDown(int i) {
        int n = static_cast<int>(data_.size());
        while (true) {
            int left = 2 * i + 1, right = 2 * i + 2, smallest = i;
            if (left < n && data_[left] < data_[smallest]) smallest = left;
            if (right < n && data_[right] < data_[smallest]) smallest = right;
            if (smallest == i) break;
            std::swap(data_[i], data_[smallest]);
            i = smallest;
        }
    }
};

int main() {
    MinHeap heap;
    for (int v : {5, 2, 8, 1, 9, 3}) heap.push(v);
    while (!heap.empty()) std::cout << heap.pop() << " ";
    std::cout << std::endl;
    return 0;
}
