import java.util.Iterator;
import java.util.NoSuchElementException;

public class CustomIterator {
    static class Fibonacci implements Iterable<Integer> {
        private final int limit;

        Fibonacci(int limit) {
            this.limit = limit;
        }

        public Iterator<Integer> iterator() {
            return new Iterator<>() {
                int a = 0, b = 1, count = 0;

                public boolean hasNext() {
                    return count < limit;
                }

                public Integer next() {
                    if (!hasNext()) throw new NoSuchElementException();
                    int value = a;
                    int next = a + b;
                    a = b;
                    b = next;
                    count++;
                    return value;
                }
            };
        }
    }

    public static void main(String[] args) {
        for (int value : new Fibonacci(8)) {
            System.out.print(value + " ");
        }
        System.out.println();
    }
}
