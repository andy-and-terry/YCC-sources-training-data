import std.stdio;

class MinStack {
    private int[] stack;
    private int[] minStack;

    void push(int value) {
        stack ~= value;
        if (minStack.length == 0 || value <= minStack[$ - 1]) {
            minStack ~= value;
        }
    }

    int pop() {
        int top = stack[$ - 1];
        stack = stack[0 .. $ - 1];
        if (top == minStack[$ - 1]) minStack = minStack[0 .. $ - 1];
        return top;
    }

    int min() {
        return minStack[$ - 1];
    }
}

void main() {
    auto s = new MinStack();
    s.push(5);
    s.push(2);
    s.push(7);
    writeln(s.min());
    s.pop();
    writeln(s.min());
}
