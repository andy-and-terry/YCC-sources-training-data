import std.stdio, std.traits;

T twice(T)(T x) if (isNumeric!T) { return x * 2; }

void main() {
    writeln(twice(21), " ", twice(1.5));
}
