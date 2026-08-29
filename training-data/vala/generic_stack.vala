class Stack<T> : Object {
    Gee.ArrayList<T> items;

    public Stack() {
        items = new Gee.ArrayList<T>();
    }

    public void push(T item) {
        items.add(item);
    }

    public T pop() {
        T item = items[items.size - 1];
        items.remove_at(items.size - 1);
        return item;
    }
}

void main() {
    var s = new Stack<int>();
    s.push(1);
    s.push(2);
    s.push(3);
    stdout.printf("%d\n", s.pop());
    stdout.printf("%d\n", s.pop());
}
