import std.stdio;
import std.traits : isIntegral, isFloatingPoint;

string kind(T)(T v) {
    static if (isIntegral!T) return "integer";
    else static if (isFloatingPoint!T) return "float";
    else static if (is(T == string)) return "string";
    else return "other";
}

void main() {
    writeln(kind(3));
    writeln(kind(2.5));
    writeln(kind("hi"));
    writeln(kind('c'));
}
