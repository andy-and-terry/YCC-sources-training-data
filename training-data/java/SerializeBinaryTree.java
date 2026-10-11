import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Queue;

public class SerializeBinaryTree {
    static class Node {
        int val;
        Node left, right;

        Node(int val) {
            this.val = val;
        }
    }

    static void write(Node n, StringBuilder sb) {
        if (n == null) {
            sb.append("#,");
            return;
        }
        sb.append(n.val).append(',');
        write(n.left, sb);
        write(n.right, sb);
    }

    static Node read(Queue<String> q) {
        String t = q.poll();
        if (t.equals("#")) return null;
        Node n = new Node(Integer.parseInt(t));
        n.left = read(q);
        n.right = read(q);
        return n;
    }

    public static void main(String[] args) {
        Node root = new Node(1);
        root.left = new Node(2);
        root.right = new Node(3);
        root.right.left = new Node(4);
        StringBuilder sb = new StringBuilder();
        write(root, sb);
        System.out.println(sb);
        Node copy = read(new ArrayDeque<>(Arrays.asList(sb.toString().split(","))));
        StringBuilder again = new StringBuilder();
        write(copy, again);
        System.out.println(again.toString().contentEquals(sb));
    }
}
