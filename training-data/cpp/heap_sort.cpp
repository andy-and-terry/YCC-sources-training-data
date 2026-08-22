#include <iostream>
#include <vector>

void siftDown(std::vector<int>& arr, int start, int end) {
    int root = start;
    while (2 * root + 1 <= end) {
        int child = 2 * root + 1;
        if (child + 1 <= end && arr[child] < arr[child + 1]) child++;
        if (arr[root] < arr[child]) {
            std::swap(arr[root], arr[child]);
            root = child;
        } else {
            return;
        }
    }
}

std::vector<int> heapSort(std::vector<int> arr) {
    int n = static_cast<int>(arr.size());
    for (int start = n / 2 - 1; start >= 0; start--) siftDown(arr, start, n - 1);
    for (int end = n - 1; end > 0; end--) {
        std::swap(arr[0], arr[end]);
        siftDown(arr, 0, end - 1);
    }
    return arr;
}

int main() {
    for (int x : heapSort({5, 3, 8, 1, 9, 2})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
