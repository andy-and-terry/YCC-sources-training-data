import java.util.Iterator;
import java.util.NoSuchElementException;

public class DequeImplementation<T> implements Iterable<T> {
    private Object[] buf = new Object[4];
    private int head, size;

    public int size() { return size; }

    private int idx(int i) { return (head + i) % buf.length; }

    private void grow() {
        Object[] next = new Object[buf.length * 2];
        for (int i = 0; i < size; i++) next[i] = buf[idx(i)];
        buf = next;
        head = 0;
    }

    public void addLast(T x) {
        if (size == buf.length) grow();
        buf[idx(size++)] = x;
    }

    public void addFirst(T x) {
        if (size == buf.length) grow();
        head = (head - 1 + buf.length) % buf.length;
        buf[head] = x;
        size++;
    }

    @SuppressWarnings("unchecked")
    public T removeFirst() {
        if (size == 0) throw new NoSuchElementException();
        T x = (T) buf[head];
        buf[head] = null;
        head = idx(1);
        size--;
        return x;
    }

    @SuppressWarnings("unchecked")
    public T removeLast() {
        if (size == 0) throw new NoSuchElementException();
        int i = idx(--size);
        T x = (T) buf[i];
        buf[i] = null;
        return x;
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<>() {
            int i = 0;

            public boolean hasNext() { return i < size; }

            @SuppressWarnings("unchecked")
            public T next() { return (T) buf[idx(i++)]; }
        };
    }

    public static void main(String[] args) {
        DequeImplementation<Integer> d = new DequeImplementation<>();
        for (int i = 0; i < 5; i++) {
            d.addLast(i);
            d.addFirst(-i);
        }
        StringBuilder sb = new StringBuilder();
        for (int x : d) sb.append(x).append(' ');
        System.out.println(sb.toString().trim());
        System.out.println(d.removeFirst() + " " + d.removeLast() + " size=" + d.size());
    }
}
