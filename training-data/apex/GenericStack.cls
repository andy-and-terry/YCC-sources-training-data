public class GenericStack {
    private List<Object> items = new List<Object>();

    public void push(Object item) {
        items.add(item);
    }

    public Object pop() {
        return items.remove(items.size() - 1);
    }

    public Boolean isEmpty() {
        return items.isEmpty();
    }

    public static void main() {
        GenericStack s = new GenericStack();
        s.push(1);
        s.push(2);
        s.push(3);
        System.debug(s.pop());
        System.debug(s.pop());
    }
}
