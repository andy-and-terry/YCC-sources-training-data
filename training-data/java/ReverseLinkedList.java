import java.util.ArrayList;
import java.util.List;

public class ReverseLinkedList {
    static class Node {
        int value;
        Node next;

        Node(int value, Node next) {
            this.value = value;
            this.next = next;
        }
    }

    public static Node reverse(Node head) {
        Node prev = null;
        Node current = head;
        while (current != null) {
            Node nextNode = current.next;
            current.next = prev;
            prev = current;
            current = nextNode;
        }
        return prev;
    }

    public static List<Integer> toList(Node head) {
        List<Integer> result = new ArrayList<>();
        while (head != null) {
            result.add(head.value);
            head = head.next;
        }
        return result;
    }

    public static void main(String[] args) {
        Node head = new Node(1, new Node(2, new Node(3, new Node(4, null))));
        System.out.println(toList(reverse(head)));
    }
}
