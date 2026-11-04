import std.stdio;
import std.algorithm : min;
import std.typecons : Tuple, tuple;

struct MinStack(T) {
    private Tuple!(T, T)[] items;

    void push(T x) {
        T m = items.length ? min(x, items[$ - 1][1]) : x;
        items ~= tuple(x, m);
    }

    T pop() {
        auto v = items[$ - 1][0];
        items = items[0 .. $ - 1];
        return v;
    }

    @property T minimum() const { return items[$ - 1][1]; }
}

void main() {
    MinStack!int s;
    foreach (v; [5, 3, 7, 2]) s.push(v);
    writeln(s.minimum);
    s.pop();
    writeln(s.minimum);
}
