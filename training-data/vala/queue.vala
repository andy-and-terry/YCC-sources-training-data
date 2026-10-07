class SimpleQueue : Object {
    int[] data = {};

    public void enqueue(int value) {
        data += value;
    }

    public int dequeue() {
        int front = data[0];
        int[] rest = new int[data.length - 1];
        for (int i = 1; i < data.length; i++) {
            rest[i - 1] = data[i];
        }
        data = rest;
        return front;
    }

    public int peek() {
        return data[0];
    }

    public bool is_empty() {
        return data.length == 0;
    }
}

void main() {
    var q = new SimpleQueue();
    foreach (int v in new int[] { 10, 20, 30 }) {
        q.enqueue(v);
    }

    stdout.printf("front: %d\n", q.peek());
    while (!q.is_empty()) {
        stdout.printf("%d ", q.dequeue());
    }
    stdout.printf("\n");
}
