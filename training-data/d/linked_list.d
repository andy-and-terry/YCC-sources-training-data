import std.stdio;

class Node {
    int value;
    Node next;
    this(int value) { this.value = value; }
}

class LinkedList {
    private Node head;

    void pushFront(int value) {
        auto node = new Node(value);
        node.next = head;
        head = node;
    }

    void pushBack(int value) {
        auto node = new Node(value);
        if (head is null) {
            head = node;
            return;
        }
        auto cur = head;
        while (cur.next !is null) cur = cur.next;
        cur.next = node;
    }

    bool remove(int value) {
        if (head is null) return false;
        if (head.value == value) {
            head = head.next;
            return true;
        }
        auto cur = head;
        while (cur.next !is null) {
            if (cur.next.value == value) {
                cur.next = cur.next.next;
                return true;
            }
            cur = cur.next;
        }
        return false;
    }

    int[] toArray() {
        int[] result;
        auto cur = head;
        while (cur !is null) {
            result ~= cur.value;
            cur = cur.next;
        }
        return result;
    }
}

void main() {
    auto list = new LinkedList();
    list.pushBack(1);
    list.pushBack(2);
    list.pushBack(3);
    list.pushFront(0);
    writeln(list.toArray());

    list.remove(2);
    writeln(list.toArray());
}
