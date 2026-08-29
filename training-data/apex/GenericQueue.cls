public class GenericQueue {
    private List<Object> items = new List<Object>();

    public void enqueue(Object item) {
        items.add(item);
    }

    public Object dequeue() {
        return items.remove(0);
    }

    public Boolean isEmpty() {
        return items.isEmpty();
    }

    public static void main() {
        GenericQueue q = new GenericQueue();
        q.enqueue(1);
        q.enqueue(2);
        q.enqueue(3);
        System.debug(q.dequeue());
        System.debug(q.dequeue());
    }
}
