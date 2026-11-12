import java.util.*;
import java.util.function.Predicate;

public class IteratorCustomFilter {
    static <T> Iterator<T> filter(Iterator<T> it, Predicate<T> p) {
        return new Iterator<>() {
            T nxt; boolean ready;
            public boolean hasNext() {
                while (!ready && it.hasNext()) { T c = it.next(); if (p.test(c)) { nxt = c; ready = true; } }
                return ready;
            }
            public T next() { if (!hasNext()) throw new NoSuchElementException(); ready = false; return nxt; }
        };
    }

    public static void main(String[] args) {
        Iterator<Integer> it = filter(List.of(1, 2, 3, 4, 5, 6).iterator(), x -> x % 3 == 0);
        while (it.hasNext()) System.out.println(it.next());
    }
}
