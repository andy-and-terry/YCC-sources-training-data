import java.util.ArrayList;
import java.util.List;

public class DoublyLinkedList<T> {
    static class DNode<T> {
        T value;
        DNode<T> prev, next;

        DNode(T value) {
            this.value = value;
        }
    }

    private DNode<T> head, tail;

    public void append(T value) {
        DNode<T> node = new DNode<>(value);
        if (head == null) {
            head = tail = node;
            return;
        }
        node.prev = tail;
        tail.next = node;
        tail = node;
    }

    public boolean remove(T value) {
        DNode<T> node = head;
        while (node != null) {
            if (node.value.equals(value)) {
                if (node.prev != null) node.prev.next = node.next;
                else head = node.next;
                if (node.next != null) node.next.prev = node.prev;
                else tail = node.prev;
                return true;
            }
            node = node.next;
        }
        return false;
    }

    public List<T> toList() {
        List<T> result = new ArrayList<>();
        DNode<T> node = head;
        while (node != null) {
            result.add(node.value);
            node = node.next;
        }
        return result;
    }

    public static void main(String[] args) {
        DoublyLinkedList<Integer> dll = new DoublyLinkedList<>();
        for (int v : new int[] {1, 2, 3, 4}) dll.append(v);
        dll.remove(3);
        System.out.println(dll.toList());
    }
}
