import java.util.Random;

public class SkipList {
    private static final int MAX_LEVEL = 4;

    private static class Node {
        int value;
        Node[] forward;

        Node(int value, int level) {
            this.value = value;
            forward = new Node[level + 1];
        }
    }

    private final Node head = new Node(Integer.MIN_VALUE, MAX_LEVEL);
    private int level = 0;
    private final Random random = new Random(42);

    private int randomLevel() {
        int lvl = 0;
        while (random.nextDouble() < 0.5 && lvl < MAX_LEVEL) lvl++;
        return lvl;
    }

    public void insert(int value) {
        Node[] update = new Node[MAX_LEVEL + 1];
        Node current = head;
        for (int i = level; i >= 0; i--) {
            while (current.forward[i] != null && current.forward[i].value < value) {
                current = current.forward[i];
            }
            update[i] = current;
        }

        int newLevel = randomLevel();
        if (newLevel > level) {
            for (int i = level + 1; i <= newLevel; i++) update[i] = head;
            level = newLevel;
        }

        Node node = new Node(value, newLevel);
        for (int i = 0; i <= newLevel; i++) {
            node.forward[i] = update[i].forward[i];
            update[i].forward[i] = node;
        }
    }

    public boolean contains(int value) {
        Node current = head;
        for (int i = level; i >= 0; i--) {
            while (current.forward[i] != null && current.forward[i].value < value) {
                current = current.forward[i];
            }
        }
        current = current.forward[0];
        return current != null && current.value == value;
    }

    public static void main(String[] args) {
        SkipList list = new SkipList();
        for (int v : new int[] {3, 6, 7, 9, 12, 19, 17}) list.insert(v);
        System.out.println("contains 9: " + list.contains(9));
        System.out.println("contains 100: " + list.contains(100));
    }
}
