public class LinkedListNode {
    public Integer value;
    public LinkedListNode next;

    public LinkedListNode(Integer value) {
        this.value = value;
    }

    public static List<Integer> reverseToList(LinkedListNode head) {
        LinkedListNode prev = null;
        LinkedListNode current = head;
        while (current != null) {
            LinkedListNode nextNode = current.next;
            current.next = prev;
            prev = current;
            current = nextNode;
        }

        List<Integer> result = new List<Integer>();
        LinkedListNode node = prev;
        while (node != null) {
            result.add(node.value);
            node = node.next;
        }
        return result;
    }
}
