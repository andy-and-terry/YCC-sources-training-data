import std.stdio;
import std.traits : isNumeric, isSomeString;

T largest(T)(T[] values) if (isNumeric!T) {
    T best = values[0];
    foreach (v; values[1 .. $]) {
        if (v > best) best = v;
    }
    return best;
}

T longestString(T)(T[] values) if (isSomeString!T) {
    T best = values[0];
    foreach (v; values[1 .. $]) {
        if (v.length > best.length) best = v;
    }
    return best;
}

void main() {
    writeln(largest([3, 7, 2, 9, 4]));
    writeln(largest([1.5, 2.75, 0.3]));
    writeln(longestString(["cat", "elephant", "dog"]));
}
