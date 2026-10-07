public class CycleDetectionLinkedList {
    static final class Node {
        final int val;
        Node next;

        Node(int val) { this.val = val; }
    }

    /** Brent's algorithm: returns {mu (start index), lambda (cycle length)} or null. */
    public static int[] brent(Node head) {
        if (head == null) return null;
        int power = 1, lambda = 1;
        Node tortoise = head, hare = head.next;
        while (hare != tortoise) {
            if (hare == null) return null;
            if (power == lambda) {
                tortoise = hare;
                power *= 2;
                lambda = 0;
            }
            hare = hare.next;
            lambda++;
        }
        tortoise = hare = head;
        for (int i = 0; i < lambda; i++) hare = hare.next;
        int mu = 0;
        while (tortoise != hare) {
            tortoise = tortoise.next;
            hare = hare.next;
            mu++;
        }
        return new int[] {mu, lambda};
    }

    static Node build(int n, int loopTo) {
        Node[] nodes = new Node[n];
        for (int i = 0; i < n; i++) nodes[i] = new Node(i);
        for (int i = 0; i + 1 < n; i++) nodes[i].next = nodes[i + 1];
        if (loopTo >= 0) nodes[n - 1].next = nodes[loopTo];
        return nodes[0];
    }

    public static void main(String[] args) {
        int[] r = brent(build(10, 3));
        System.out.println("cycle starts at " + r[0] + ", length " + r[1]);
        System.out.println(brent(build(5, -1)) == null ? "no cycle" : "cycle");
    }
}
