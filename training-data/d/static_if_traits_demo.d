import std.stdio;
import std.traits;

struct Point { int x; int y; }
struct Named { string name; }

string describe(T)(T value) {
    static if (is(T == struct) && hasMember!(T, "x") && hasMember!(T, "y")) {
        return "point-like";
    } else static if (is(T == struct) && hasMember!(T, "name")) {
        return "named";
    } else static if (isNumeric!T) {
        return "numeric";
    } else {
        return "unknown";
    }
}

void main() {
    writeln(describe(Point(1, 2)));
    writeln(describe(Named("widget")));
    writeln(describe(42));
    writeln(describe(3.14));
    writeln(describe("hello"));
}
