import std.stdio;
import std.conv : to;

mixin template Comparable(T) {
    bool greaterThan(T other) {
        return this.value > other.value;
    }

    bool lessThan(T other) {
        return this.value < other.value;
    }
}

mixin template Describable() {
    string describe() {
        return typeof(this).stringof ~ "(" ~ to!string(this.value) ~ ")";
    }
}

class Box {
    int value;
    this(int value) { this.value = value; }

    mixin Comparable!Box;
    mixin Describable;
}

string makeGreeter(string name)() {
    return "Hello, " ~ name ~ "!";
}

void main() {
    auto a = new Box(3);
    auto b = new Box(7);
    writeln(a.greaterThan(b));
    writeln(a.lessThan(b));
    writeln(a.describe());
    writeln(b.describe());

    writeln(makeGreeter!("World")());
}
