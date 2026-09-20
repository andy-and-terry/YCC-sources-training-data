import std.stdio;
import std.typecons : Nullable, nullable;

Nullable!int findFirstEven(int[] values) {
    foreach (v; values) {
        if (v % 2 == 0) return nullable(v);
    }
    return Nullable!int.init;
}

void main() {
    auto found = findFirstEven([1, 3, 5, 8, 9]);
    if (!found.isNull) {
        writeln("first even: ", found.get);
    } else {
        writeln("no even value found");
    }

    auto notFound = findFirstEven([1, 3, 5]);
    writeln("found: ", !notFound.isNull);
    writeln(notFound.get(-1));
}
