import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Iterator;

public class ArrayDequeDemo {
    static boolean isPalindrome(String s) {
        Deque<Character> dq = new ArrayDeque<>();
        for (char c : s.toLowerCase().toCharArray()) {
            if (Character.isLetterOrDigit(c)) dq.addLast(c);
        }
        while (dq.size() > 1) {
            if (dq.pollFirst() != dq.pollLast()) return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Deque<Integer> dq = new ArrayDeque<>();
        dq.offerFirst(2);
        dq.offerFirst(1);
        dq.offerLast(3);
        dq.offerLast(4);
        System.out.println(dq + " first=" + dq.peekFirst() + " last=" + dq.peekLast());

        Iterator<Integer> desc = dq.descendingIterator();
        while (desc.hasNext()) System.out.print(desc.next() + " ");
        System.out.println();

        // As a stack
        Deque<String> stack = new ArrayDeque<>();
        stack.push("a");
        stack.push("b");
        System.out.println(stack.pop() + stack.pop());

        System.out.println(isPalindrome("A man, a plan, a canal: Panama"));
    }
}
