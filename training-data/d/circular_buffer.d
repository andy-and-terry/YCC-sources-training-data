import std.stdio;

struct CircularBuffer {
    int[3] buffer;
    int head = 0;
    int size = 0;

    void add(int value) {
        int tail = (head + size) % 3;
        buffer[tail] = value;
        if (size < 3) size++;
        else head = (head + 1) % 3;
    }

    int[] toArray() {
        int[] result;
        foreach (i; 0 .. size) {
            result ~= buffer[(head + i) % 3];
        }
        return result;
    }
}

void main() {
    CircularBuffer cb;
    foreach (v; [1, 2, 3, 4, 5]) cb.add(v);
    writeln(cb.toArray());
}
