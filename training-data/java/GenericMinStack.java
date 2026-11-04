import java.util.ArrayDeque;
import java.util.Comparator;
import java.util.Deque;

public class GenericMinStack<T> {
    private record Entry<T>(T value, T min) {}

    private final Deque<Entry<T>> items = new ArrayDeque<>();
    private final Comparator<? super T> cmp;

    GenericMinStack(Comparator<? super T> cmp) { this.cmp = cmp; }

    void push(T v) {
        Entry<T> top = items.peek();
        T min = (top == null || cmp.compare(v, top.min()) < 0) ? v : top.min();
        items.push(new Entry<>(v, min));
    }

    T pop() { return items.pop().value(); }

    T min() { return items.peek().min(); }

    public static void main(String[] args) {
        GenericMinStack<Integer> s = new GenericMinStack<>(Comparator.naturalOrder());
        for (int v : new int[]{5, 3, 7, 2}) s.push(v);
        System.out.println(s.min());
        s.pop();
        System.out.println(s.min());
    }
}
