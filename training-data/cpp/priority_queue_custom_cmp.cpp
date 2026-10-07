#include <iostream>
#include <queue>
#include <string>
#include <vector>

struct Task {
    int priority;
    std::string name;
};

struct ByPriority {
    bool operator()(const Task &a, const Task &b) const { return a.priority < b.priority; }
};

int main() {
    std::priority_queue<Task, std::vector<Task>, ByPriority> pq;
    pq.push({2, "write"});
    pq.push({5, "deploy"});
    pq.push({1, "rest"});
    pq.push({4, "test"});
    while (!pq.empty()) {
        std::cout << pq.top().priority << " " << pq.top().name << "\n";
        pq.pop();
    }
    std::priority_queue<int, std::vector<int>, std::greater<>> minheap;
    for (int x : {5, 1, 4, 2}) minheap.push(x);
    std::cout << "min: " << minheap.top() << "\n";
}
