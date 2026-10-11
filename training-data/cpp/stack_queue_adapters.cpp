#include <iostream>
#include <queue>
#include <stack>

int main() {
    std::stack<int> st;
    for (int i = 1; i <= 4; ++i) st.push(i * i);
    std::cout << "stack top=" << st.top() << " size=" << st.size() << "\n";
    while (!st.empty()) { std::cout << st.top() << ' '; st.pop(); }
    std::cout << "\n";

    std::queue<std::string> q;
    q.push("first"); q.push("second"); q.push("third");
    std::cout << "front=" << q.front() << " back=" << q.back() << "\n";
    while (!q.empty()) { std::cout << q.front() << ' '; q.pop(); }
    std::cout << "\n";
}
