#include <iostream>
#include <queue>
#include <string>
#include <vector>

struct Task {
    std::string name;
    int priority;
};

struct ByPriority {
    bool operator()(const Task& a, const Task& b) const {
        return a.priority < b.priority;  // max-heap on priority
    }
};

int main() {
    std::priority_queue<Task, std::vector<Task>, ByPriority> tasks;
    tasks.push({"write docs", 2});
    tasks.push({"fix outage", 10});
    tasks.push({"refactor", 4});

    while (!tasks.empty()) {
        std::cout << tasks.top().priority << " " << tasks.top().name << "\n";
        tasks.pop();
    }

    std::priority_queue<int, std::vector<int>, std::greater<int>> minHeap;
    for (int x : {5, 1, 8, 3}) minHeap.push(x);
    std::cout << "smallest: " << minHeap.top() << "\n";
    return 0;
}
