#include <iostream>
#include <deque>

template <typename T>
class Queue {
public:
    void enqueue(const T& item) { items.push_back(item); }

    T dequeue() {
        T item = items.front();
        items.pop_front();
        return item;
    }

    bool isEmpty() const { return items.empty(); }

private:
    std::deque<T> items;
};

int main() {
    Queue<int> q;
    q.enqueue(1);
    q.enqueue(2);
    q.enqueue(3);
    std::cout << q.dequeue() << " " << q.isEmpty() << std::endl;
    return 0;
}
