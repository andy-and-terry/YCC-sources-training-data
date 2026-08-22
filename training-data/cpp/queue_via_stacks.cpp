#include <iostream>
#include <optional>
#include <stack>

class QueueViaStacks {
public:
    void enqueue(int item) { inStack.push(item); }

    std::optional<int> dequeue() {
        if (outStack.empty()) {
            while (!inStack.empty()) {
                outStack.push(inStack.top());
                inStack.pop();
            }
        }
        if (outStack.empty()) return std::nullopt;
        int item = outStack.top();
        outStack.pop();
        return item;
    }

private:
    std::stack<int> inStack, outStack;
};

int main() {
    QueueViaStacks q;
    q.enqueue(1);
    q.enqueue(2);
    q.enqueue(3);
    std::cout << *q.dequeue() << " " << *q.dequeue() << std::endl;
    return 0;
}
