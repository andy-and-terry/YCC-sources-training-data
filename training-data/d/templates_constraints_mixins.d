import std.stdio, std.traits, std.conv;

T maxOf(T)(T a, T b) if (isNumeric!T) { return a > b ? a : b; }

struct Stack(T) {
    private T[] items;
    void push(T x) { items ~= x; }
    T pop() { auto r = items[$ - 1]; items = items[0 .. $ - 1]; return r; }
    @property size_t length() const { return items.length; }
}

template Square(alias x) { enum Square = x * x; }
mixin template Greeter() { string greet() { return "hi " ~ name; } }
struct Person { string name; mixin Greeter; }

string repeatStr(string s, size_t n)() { return s ~ to!string(n); }

void main() {
    writeln(maxOf(3, 9), " ", maxOf(2.5, 1.5));
    auto s = Stack!string();
    s.push("a"); s.push("b");
    writeln(s.pop, s.length);
    enum sq = Square!7;
    static assert(sq == 49);
    writeln(sq, " ", Person("Ada").greet(), " ", repeatStr!("x", 3)());
    writeln(is(int : long), " ", isIntegral!int, " ", typeof(1.5).stringof, " ", ReturnType!(maxOf!int).stringof);
    mixin("int dyn = 5 * 5;");
    writeln(dyn);
}
