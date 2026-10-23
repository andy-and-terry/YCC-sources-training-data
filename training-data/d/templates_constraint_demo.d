import std.stdio;
import std.traits : isNumeric;

T sumAll(T)(T[] xs) if (isNumeric!T) {
    T total = 0;
    foreach (x; xs) total += x;
    return total;
}

void main() {
    writeln(sumAll([1, 2, 3]));
    writeln(sumAll([1.5, 2.5]));
}
