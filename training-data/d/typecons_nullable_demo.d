import std.stdio;
import std.typecons : Nullable, nullable;

Nullable!int findIndex(int[] xs, int v) {
    foreach (i, x; xs)
        if (x == v) return nullable(cast(int) i);
    return Nullable!int.init;
}

void main() {
    auto r = findIndex([5, 6, 7], 6);
    if (!r.isNull) writeln("found at ", r.get);
    auto n = findIndex([5, 6, 7], 1);
    writeln(n.isNull);
    writeln(n.get(-1));
}
