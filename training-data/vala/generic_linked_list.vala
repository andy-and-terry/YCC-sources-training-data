delegate void Visitor<G>(G item);

class Node<G> : Object {
    public G value;
    public Node<G>? next;

    public Node(G value) {
        this.value = value;
    }
}

class LinkedList<G> : Object {
    private Node<G>? head;
    private Node<G>? tail;
    private int count = 0;

    public void add(G value) {
        var node = new Node<G>(value);
        if (tail == null) {
            head = node;
            tail = node;
        } else {
            tail.next = node;
            tail = node;
        }
        count++;
    }

    public int size() {
        return count;
    }

    public void for_each(Visitor<G> visitor) {
        Node<G>? current = head;
        while (current != null) {
            visitor(current.value);
            current = current.next;
        }
    }
}

void main() {
    var numbers = new LinkedList<int>();
    numbers.add(1);
    numbers.add(2);
    numbers.add(3);

    numbers.for_each((n) => {
        stdout.printf("%d ", n);
    });
    stdout.printf("\n");
    stdout.printf("size: %d\n", numbers.size());

    var words = new LinkedList<string>();
    words.add("alpha");
    words.add("beta");
    words.for_each((w) => {
        stdout.printf("%s ", w);
    });
    stdout.printf("\n");
}
