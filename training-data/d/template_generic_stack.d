import std.stdio;

class Stack(T) {
    private T[] items;

    void push(T item) { items ~= item; }

    T pop() {
        auto item = items[$ - 1];
        items = items[0 .. $ - 1];
        return item;
    }

    T peek() { return items[$ - 1]; }

    bool empty() { return items.length == 0; }
}

void main() {
    auto s = new Stack!int();
    s.push(1);
    s.push(2);
    s.push(3);
    writeln(s.pop());
    writeln(s.peek());
}
