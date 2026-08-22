import java.util.ArrayList;
import java.util.List;

public class CircularBuffer<T> {
    private final Object[] buffer;
    private final int capacity;
    private int head = 0;
    private int size = 0;

    public CircularBuffer(int capacity) {
        this.capacity = capacity;
        this.buffer = new Object[capacity];
    }

    public void append(T item) {
        int tail = (head + size) % capacity;
        buffer[tail] = item;
        if (size < capacity) {
            size++;
        } else {
            head = (head + 1) % capacity;
        }
    }

    @SuppressWarnings("unchecked")
    public List<T> toList() {
        List<T> result = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            result.add((T) buffer[(head + i) % capacity]);
        }
        return result;
    }

    public static void main(String[] args) {
        CircularBuffer<Integer> cb = new CircularBuffer<>(3);
        for (int i = 0; i < 5; i++) cb.append(i);
        System.out.println(cb.toList());
    }
}
