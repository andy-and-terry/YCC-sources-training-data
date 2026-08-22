import java.util.ArrayDeque;
import java.util.Deque;

public class QueueViaStacks {
    private final Deque<Integer> inStack = new ArrayDeque<>();
    private final Deque<Integer> outStack = new ArrayDeque<>();

    public void enqueue(int item) {
        inStack.push(item);
    }

    public Integer dequeue() {
        if (outStack.isEmpty()) {
            while (!inStack.isEmpty()) outStack.push(inStack.pop());
        }
        return outStack.isEmpty() ? null : outStack.pop();
    }

    public boolean isEmpty() {
        return inStack.isEmpty() && outStack.isEmpty();
    }

    public static void main(String[] args) {
        QueueViaStacks q = new QueueViaStacks();
        q.enqueue(1);
        q.enqueue(2);
        q.enqueue(3);
        System.out.println(q.dequeue() + " " + q.dequeue() + " " + q.isEmpty());
    }
}
