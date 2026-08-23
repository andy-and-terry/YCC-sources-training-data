class CircularBuffer {
    def data
    int capacity
    int size = 0
    int start = 0

    CircularBuffer(int cap) {
        capacity = cap
        data = new Object[cap]
    }

    void push(value) {
        int index = (start + size) % capacity
        data[index] = value
        if (size < capacity) {
            size++
        } else {
            start = (start + 1) % capacity
        }
    }

    List toList() {
        return (0..<size).collect { data[(start + it) % capacity] }
    }
}

def buf = new CircularBuffer(3)
[1, 2, 3, 4, 5].each { buf.push(it) }
println buf.toList()
