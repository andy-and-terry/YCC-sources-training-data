import java.util.Iterator;

public class IteratorFibonacci implements Iterable<Long> {
    private final int count;
    IteratorFibonacci(int count) { this.count = count; }

    public Iterator<Long> iterator() {
        return new Iterator<>() {
            long a = 0, b = 1;
            int i = 0;
            public boolean hasNext() { return i < count; }
            public Long next() { long r = a; a = b; b = r + b; i++; return r; }
        };
    }

    public static void main(String[] args) {
        for (long f : new IteratorFibonacci(10)) System.out.print(f + " ");
        System.out.println();
    }
}
