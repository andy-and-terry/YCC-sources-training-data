public class Stack {
    private List<Object> items = new List<Object>();

    public void push(Object item) {
        items.add(item);
    }

    public Object pop() {
        Object item = items[items.size() - 1];
        items.remove(items.size() - 1);
        return item;
    }

    public Object peek() {
        return items[items.size() - 1];
    }

    public Boolean isEmpty() {
        return items.isEmpty();
    }
}
