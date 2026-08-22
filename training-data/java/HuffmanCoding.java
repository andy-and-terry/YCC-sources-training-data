import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;

public class HuffmanCoding {
    static class Node implements Comparable<Node> {
        Character ch;
        int freq;
        Node left, right;

        Node(Character ch, int freq) {
            this.ch = ch;
            this.freq = freq;
        }

        public int compareTo(Node other) {
            return this.freq - other.freq;
        }
    }

    public static Node buildTree(String text) {
        Map<Character, Integer> counts = new HashMap<>();
        for (char ch : text.toCharArray()) counts.merge(ch, 1, Integer::sum);

        PriorityQueue<Node> heap = new PriorityQueue<>();
        for (Map.Entry<Character, Integer> entry : counts.entrySet()) {
            heap.add(new Node(entry.getKey(), entry.getValue()));
        }

        while (heap.size() > 1) {
            Node a = heap.poll();
            Node b = heap.poll();
            Node parent = new Node(null, a.freq + b.freq);
            parent.left = a;
            parent.right = b;
            heap.add(parent);
        }
        return heap.poll();
    }

    public static Map<Character, String> buildCodes(Node node, String prefix, Map<Character, String> codes) {
        if (node.ch != null) {
            codes.put(node.ch, prefix.isEmpty() ? "0" : prefix);
            return codes;
        }
        buildCodes(node.left, prefix + "0", codes);
        buildCodes(node.right, prefix + "1", codes);
        return codes;
    }

    public static String encode(String text) {
        Map<Character, String> codes = buildCodes(buildTree(text), "", new HashMap<>());
        StringBuilder result = new StringBuilder();
        for (char ch : text.toCharArray()) result.append(codes.get(ch));
        return result.toString();
    }

    public static void main(String[] args) {
        System.out.println(encode("abracadabra"));
    }
}
