public class CircularBuffer {
    private List<Integer> items = new List<Integer>();
    private Integer capacity;

    public CircularBuffer(Integer capacity) {
        this.capacity = capacity;
    }

    public void push(Integer item) {
        if (items.size() >= capacity) {
            items.remove(0);
        }
        items.add(item);
    }

    public static void main() {
        CircularBuffer buf = new CircularBuffer(3);
        for (Integer v : new List<Integer>{1, 2, 3, 4, 5}) {
            buf.push(v);
        }
        System.debug(buf.items);
    }
}
