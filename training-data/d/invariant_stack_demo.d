import std.stdio;

class BoundedStack {
    private int[] items;
    private size_t capacity;

    this(size_t capacity)
    in (capacity > 0, "capacity must be positive")
    {
        this.capacity = capacity;
    }

    void push(int value)
    in (items.length < capacity, "stack overflow")
    out
    {
        assert(items.length > 0, "push must grow the stack");
    }
    do
    {
        items ~= value;
    }

    int pop()
    in (items.length > 0, "stack underflow")
    out
    {
        assert(items.length < capacity, "pop must shrink below capacity");
    }
    do
    {
        auto value = items[$ - 1];
        items = items[0 .. $ - 1];
        return value;
    }

    invariant {
        assert(items.length <= capacity, "items must never exceed capacity");
    }
}

void main() {
    auto stack = new BoundedStack(3);
    stack.push(1);
    stack.push(2);
    stack.push(3);
    writeln(stack.pop());

    try {
        stack.push(10);
        stack.push(20);
    } catch (Throwable e) {
        writeln("caught: ", e.msg);
    }
}
