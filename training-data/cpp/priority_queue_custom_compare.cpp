#include <iostream>
#include <queue>
#include <string>
#include <vector>

struct Task {
    int priority;
    std::string name;
};

struct ByPriorityAsc {      // makes a min-heap on priority
    bool operator()(const Task& a, const Task& b) const { return a.priority > b.priority; }
};

int main() {
    std::priority_queue<Task, std::vector<Task>, ByPriorityAsc> pq;
    pq.push({3, "write"}); pq.push({1, "plan"}); pq.push({2, "code"});
    while (!pq.empty()) {
        std::cout << pq.top().priority << ":" << pq.top().name << " ";
        pq.pop();
    }
    std::cout << "\n";
}
