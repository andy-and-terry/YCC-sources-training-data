import java.util.Iterator;
import java.util.NoSuchElementException;

public class IteratorInnerClass implements Iterable<Integer> {
    private final int[] data = {4, 8, 15, 16, 23, 42};

    @Override
    public Iterator<Integer> iterator() {
        return new Iterator<>() {
            private int i = 0;
            public boolean hasNext() { return i < data.length; }
            public Integer next() {
                if (!hasNext()) throw new NoSuchElementException();
                return data[i++];
            }
        };
    }

    public static void main(String[] args) {
        for (int n : new IteratorInnerClass()) System.out.print(n + " ");
        System.out.println();
    }
}
