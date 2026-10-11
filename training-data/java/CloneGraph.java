import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CloneGraph {
    static class Node {
        int val;
        List<Node> neighbors = new ArrayList<>();

        Node(int val) {
            this.val = val;
        }
    }

    static Node clone(Node node, Map<Node, Node> seen) {
        if (node == null) return null;
        if (seen.containsKey(node)) return seen.get(node);
        Node copy = new Node(node.val);
        seen.put(node, copy);
        for (Node nb : node.neighbors) copy.neighbors.add(clone(nb, seen));
        return copy;
    }

    public static void main(String[] args) {
        Node a = new Node(1), b = new Node(2), c = new Node(3);
        a.neighbors.add(b);
        a.neighbors.add(c);
        b.neighbors.add(c);
        c.neighbors.add(a);
        Node copy = clone(a, new HashMap<>());
        System.out.println(copy != a);
        System.out.println(copy.neighbors.get(0).val + " " + copy.neighbors.get(1).val);
        System.out.println(copy.neighbors.get(1).neighbors.get(0) == copy);
    }
}
