import java.util.ArrayDeque;
import java.util.Deque;

public class ArrayDequeDemo {
    public static void main(String[] args) {
        Deque<Integer> stack = new ArrayDeque<>();
        stack.push(1);
        stack.push(2);
        stack.push(3);
        System.out.println(stack.pop() + " " + stack.peek());

        Deque<String> queue = new ArrayDeque<>();
        queue.offer("a");
        queue.offer("b");
        queue.offerFirst("front");
        System.out.println(queue.poll() + " " + queue.pollLast() + " " + queue);

        var it = new ArrayDeque<>(java.util.List.of(1, 2, 3)).descendingIterator();
        while (it.hasNext()) System.out.print(it.next() + " ");
        System.out.println();
    }
}
