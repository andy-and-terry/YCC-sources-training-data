import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

public class GenericBST<T extends Comparable<T>> implements Iterable<T> {
    private Node root;
    private int size;

    private class Node {
        T value;
        Node left, right;

        Node(T value) {
            this.value = value;
        }
    }

    public void insert(T value) {
        root = insert(root, value);
    }

    private Node insert(Node node, T value) {
        if (node == null) {
            size++;
            return new Node(value);
        }
        int cmp = value.compareTo(node.value);
        if (cmp < 0) node.left = insert(node.left, value);
        else if (cmp > 0) node.right = insert(node.right, value);
        return node;
    }

    public boolean contains(T value) {
        Node current = root;
        while (current != null) {
            int cmp = value.compareTo(current.value);
            if (cmp == 0) return true;
            current = cmp < 0 ? current.left : current.right;
        }
        return false;
    }

    public int size() {
        return size;
    }

    @Override
    public Iterator<T> iterator() {
        List<T> values = new ArrayList<>();
        inOrder(root, values);
        return new Iterator<T>() {
            int index = 0;

            @Override
            public boolean hasNext() {
                return index < values.size();
            }

            @Override
            public T next() {
                if (!hasNext()) throw new NoSuchElementException();
                return values.get(index++);
            }
        };
    }

    private void inOrder(Node node, List<T> values) {
        if (node == null) return;
        inOrder(node.left, values);
        values.add(node.value);
        inOrder(node.right, values);
    }

    public static void main(String[] args) {
        GenericBST<Integer> tree = new GenericBST<>();
        for (int v : new int[] {5, 3, 8, 1, 4, 7, 9}) tree.insert(v);
        for (int value : tree) {
            System.out.print(value + " ");
        }
        System.out.println();
        System.out.println(tree.contains(7) + " " + tree.contains(6));
    }
}
