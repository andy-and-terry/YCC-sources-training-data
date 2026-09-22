interface Container<G> : Object {
    public abstract void put(G item);
    public abstract G? take();
    public abstract int size();
}

class SimpleStack<G> : Object, Container<G> {
    private Gee.ArrayList<G> items = new Gee.ArrayList<G>();

    public void put(G item) {
        items.add(item);
    }

    public G? take() {
        if (items.size == 0) {
            return null;
        }
        int last = items.size - 1;
        G item = items[last];
        items.remove_at(last);
        return item;
    }

    public int size() {
        return items.size;
    }
}

void print_all(Container<int> c) {
    while (c.size() > 0) {
        stdout.printf("%d\n", c.take());
    }
}

void main() {
    var stack = new SimpleStack<int>();
    stack.put(1);
    stack.put(2);
    stack.put(3);

    print_all(stack);
}
