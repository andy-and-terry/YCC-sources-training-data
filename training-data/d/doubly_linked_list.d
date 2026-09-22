import std.stdio;

class DNode {
    int value;
    DNode prev;
    DNode next;
    this(int value) { this.value = value; }
}

class DoublyLinkedList {
    private DNode head;
    private DNode tail;

    void pushBack(int value) {
        auto node = new DNode(value);
        if (tail is null) {
            head = node;
            tail = node;
        } else {
            tail.next = node;
            node.prev = tail;
            tail = node;
        }
    }

    void pushFront(int value) {
        auto node = new DNode(value);
        if (head is null) {
            head = node;
            tail = node;
        } else {
            head.prev = node;
            node.next = head;
            head = node;
        }
    }

    int[] toArray() {
        int[] result;
        auto node = head;
        while (node !is null) {
            result ~= node.value;
            node = node.next;
        }
        return result;
    }
}

void main() {
    auto list = new DoublyLinkedList();
    list.pushBack(2);
    list.pushBack(3);
    list.pushFront(1);
    writeln(list.toArray());
}
