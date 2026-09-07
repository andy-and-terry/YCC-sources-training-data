class PriorityQueue : Object {
    int[] heap = {};

    public void push(int value) {
        heap += value;
        int i = heap.length - 1;
        while (i > 0) {
            int parent = (i - 1) / 2;
            if (heap[parent] <= heap[i]) break;
            int tmp = heap[parent];
            heap[parent] = heap[i];
            heap[i] = tmp;
            i = parent;
        }
    }

    public int pop() {
        int top = heap[0];
        int last = heap.length - 1;
        heap[0] = heap[last];
        heap.resize(last);

        int i = 0;
        while (true) {
            int left = 2 * i + 1;
            int right = 2 * i + 2;
            int smallest = i;
            if (left < heap.length && heap[left] < heap[smallest]) smallest = left;
            if (right < heap.length && heap[right] < heap[smallest]) smallest = right;
            if (smallest == i) break;
            int tmp = heap[smallest];
            heap[smallest] = heap[i];
            heap[i] = tmp;
            i = smallest;
        }
        return top;
    }

    public bool is_empty() {
        return heap.length == 0;
    }
}

void main() {
    var pq = new PriorityQueue();
    foreach (int v in new int[] {5, 3, 8, 1, 9, 2}) {
        pq.push(v);
    }
    while (!pq.is_empty()) {
        stdout.printf("%d ", pq.pop());
    }
    stdout.printf("\n");
}
