class Node : Object {
    public int value;
    public Node? prev;
    public Node? next;

    public Node(int value) {
        this.value = value;
    }
}

class DoublyLinkedList : Object {
    private Node? head;
    private Node? tail;

    public void push_back(int value) {
        var node = new Node(value);
        if (tail == null) {
            head = node;
            tail = node;
        } else {
            node.prev = tail;
            tail.next = node;
            tail = node;
        }
    }

    public void print_forward() {
        Node? current = head;
        while (current != null) {
            stdout.printf("%d ", current.value);
            current = current.next;
        }
        stdout.printf("\n");
    }

    public void print_backward() {
        Node? current = tail;
        while (current != null) {
            stdout.printf("%d ", current.value);
            current = current.prev;
        }
        stdout.printf("\n");
    }
}

void main() {
    var list = new DoublyLinkedList();
    foreach (int v in new int[] { 1, 2, 3, 4, 5 }) {
        list.push_back(v);
    }
    list.print_forward();
    list.print_backward();
}
