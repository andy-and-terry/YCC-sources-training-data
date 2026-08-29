class CircularBuffer : Object {
    int[] data;
    int capacity;
    int size;
    int start;

    public CircularBuffer(int cap) {
        capacity = cap;
        data = new int[cap];
        size = 0;
        start = 0;
    }

    public void push(int value) {
        int index = (start + size) % capacity;
        data[index] = value;
        if (size < capacity) {
            size++;
        } else {
            start = (start + 1) % capacity;
        }
    }

    public int[] to_array() {
        int[] result = {};
        for (int i = 0; i < size; i++) {
            result += data[(start + i) % capacity];
        }
        return result;
    }
}

void main() {
    var buf = new CircularBuffer(3);
    int[] values = { 1, 2, 3, 4, 5 };
    foreach (int v in values) buf.push(v);
    foreach (int x in buf.to_array()) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
