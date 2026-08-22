import std.stdio;

struct Stack(T) {
    private T[] items;

    void push(T item) {
        items ~= item;
    }

    T pop() {
        auto item = items[$ - 1];
        items = items[0 .. $ - 1];
        return item;
    }

    T peek() {
        return items[$ - 1];
    }

    bool isEmpty() {
        return items.length == 0;
    }
}

void main() {
    Stack!int stack;
    stack.push(1);
    stack.push(2);
    stack.push(3);
    writeln(stack.pop(), " ", stack.peek(), " ", stack.isEmpty());
}
