import std.stdio;

class MinPriorityQueue {
    private int[] heap;

    void push(int value) {
        heap ~= value;
        size_t i = heap.length - 1;
        while (i > 0) {
            size_t parent = (i - 1) / 2;
            if (heap[parent] <= heap[i]) break;
            auto tmp = heap[parent];
            heap[parent] = heap[i];
            heap[i] = tmp;
            i = parent;
        }
    }

    int pop() {
        auto top = heap[0];
        heap[0] = heap[$ - 1];
        heap = heap[0 .. $ - 1];
        size_t i = 0;
        while (true) {
            size_t left = 2 * i + 1;
            size_t right = 2 * i + 2;
            size_t smallest = i;
            if (left < heap.length && heap[left] < heap[smallest]) smallest = left;
            if (right < heap.length && heap[right] < heap[smallest]) smallest = right;
            if (smallest == i) break;
            auto tmp = heap[smallest];
            heap[smallest] = heap[i];
            heap[i] = tmp;
            i = smallest;
        }
        return top;
    }

    bool empty() { return heap.length == 0; }
}

void main() {
    auto pq = new MinPriorityQueue();
    foreach (v; [5, 3, 8, 1, 9, 2]) pq.push(v);
    while (!pq.empty()) {
        write(pq.pop(), " ");
    }
    writeln();
}
