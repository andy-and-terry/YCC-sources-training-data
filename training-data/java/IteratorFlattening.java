import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

public class IteratorFlattening implements Iterator<Integer> {
    private final Deque<Iterator<?>> stack = new ArrayDeque<>();
    private Integer nextValue;

    IteratorFlattening(List<?> nested) {
        stack.push(nested.iterator());
    }

    private void advance() {
        while (nextValue == null && !stack.isEmpty()) {
            Iterator<?> top = stack.peek();
            if (!top.hasNext()) {
                stack.pop();
                continue;
            }
            Object o = top.next();
            if (o instanceof List<?> inner) stack.push(inner.iterator());
            else nextValue = (Integer) o;
        }
    }

    @Override
    public boolean hasNext() {
        advance();
        return nextValue != null;
    }

    @Override
    public Integer next() {
        if (!hasNext()) throw new NoSuchElementException();
        Integer v = nextValue;
        nextValue = null;
        return v;
    }

    public static void main(String[] args) {
        List<Object> nested = List.of(1, List.of(2, List.of(3, 4)), List.of(), 5);
        IteratorFlattening it = new IteratorFlattening(nested);
        while (it.hasNext()) System.out.print(it.next() + " ");
        System.out.println();
    }
}
