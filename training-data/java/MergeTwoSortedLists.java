import java.util.ArrayList;
import java.util.List;

public class MergeTwoSortedLists {
    static final class Node {
        int val;
        Node next;

        Node(int val, Node next) {
            this.val = val;
            this.next = next;
        }
    }

    static Node of(int... vals) {
        Node head = null;
        for (int i = vals.length - 1; i >= 0; i--) head = new Node(vals[i], head);
        return head;
    }

    static List<Integer> toList(Node n) {
        List<Integer> out = new ArrayList<>();
        for (; n != null; n = n.next) out.add(n.val);
        return out;
    }

    public static Node merge(Node a, Node b) {
        Node dummy = new Node(0, null), tail = dummy;
        while (a != null && b != null) {
            if (a.val <= b.val) {
                tail.next = a;
                a = a.next;
            } else {
                tail.next = b;
                b = b.next;
            }
            tail = tail.next;
        }
        tail.next = a != null ? a : b;
        return dummy.next;
    }

    /** Bottom-up merge sort built on merge(). */
    public static Node sort(Node head) {
        if (head == null || head.next == null) return head;
        Node slow = head, fast = head.next;
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }
        Node second = slow.next;
        slow.next = null;
        return merge(sort(head), sort(second));
    }

    public static void main(String[] args) {
        System.out.println(toList(merge(of(1, 2, 4, 9), of(1, 3, 4, 5, 10))));
        System.out.println(toList(sort(of(5, -1, 3, 8, 0, 2))));
    }
}
