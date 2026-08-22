public class Stack<T> {
    private Gee.ArrayList<T> items = new Gee.ArrayList<T>();

    public void push(T item) {
        items.add(item);
    }

    public T pop() {
        T item = items.get(items.size - 1);
        items.remove_at(items.size - 1);
        return item;
    }

    public bool is_empty() {
        return items.size == 0;
    }
}
