#include <algorithm>
#include <iostream>
#include <stack>

class MinStack {
public:
    void push(int value) {
        items.push(value);
        mins.push(mins.empty() ? value : std::min(value, mins.top()));
    }

    void pop() {
        items.pop();
        mins.pop();
    }

    int getMin() const { return mins.top(); }

private:
    std::stack<int> items, mins;
};

int main() {
    MinStack s;
    s.push(3);
    s.push(1);
    s.push(2);
    std::cout << s.getMin() << std::endl;
    s.pop();
    std::cout << s.getMin() << std::endl;
    return 0;
}
