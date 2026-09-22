class ListNode : Object {
    public int value;
    public ListNode? next;

    public ListNode(int v) {
        value = v;
        next = null;
    }
}

class LinkedList : Object {
    ListNode? head;
    ListNode? tail;

    public void append(int value) {
        var node = new ListNode(value);
        if (head == null) {
            head = node;
            tail = node;
        } else {
            tail.next = node;
            tail = node;
        }
    }

    public bool contains(int value) {
        ListNode? cur = head;
        while (cur != null) {
            if (cur.value == value) return true;
            cur = cur.next;
        }
        return false;
    }

    public void reverse() {
        ListNode? prev = null;
        ListNode? cur = head;
        tail = head;
        while (cur != null) {
            ListNode? next = cur.next;
            cur.next = prev;
            prev = cur;
            cur = next;
        }
        head = prev;
    }

    public int[] to_array() {
        int[] result = {};
        ListNode? cur = head;
        while (cur != null) {
            result += cur.value;
            cur = cur.next;
        }
        return result;
    }
}

void main() {
    var list = new LinkedList();
    foreach (int v in new int[] { 1, 2, 3, 4, 5 }) {
        list.append(v);
    }

    stdout.printf("%s\n", list.contains(3).to_string());
    stdout.printf("%s\n", list.contains(9).to_string());

    list.reverse();
    foreach (int x in list.to_array()) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
