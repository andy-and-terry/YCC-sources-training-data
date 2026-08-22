import java.util.ArrayDeque;
import java.util.Deque;

public class MinStack {
    private final Deque<Integer> items = new ArrayDeque<>();
    private final Deque<Integer> mins = new ArrayDeque<>();

    public void push(int value) {
        items.push(value);
        mins.push(mins.isEmpty() ? value : Math.min(value, mins.peek()));
    }

    public int pop() {
        mins.pop();
        return items.pop();
    }

    public int top() {
        return items.peek();
    }

    public int getMin() {
        return mins.peek();
    }

    public static void main(String[] args) {
        MinStack s = new MinStack();
        s.push(3);
        s.push(1);
        s.push(2);
        System.out.println(s.getMin());
        s.pop();
        System.out.println(s.getMin());
    }
}
