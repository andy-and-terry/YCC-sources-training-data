import std.stdio;
import std.typecons : Nullable, nullable;

Nullable!int findIndex(int[] arr, int target) {
    foreach (i, v; arr)
        if (v == target) return nullable(cast(int) i);
    return Nullable!int.init;
}

void main() {
    auto r = findIndex([5, 6, 7], 6);
    if (!r.isNull) writeln("found at ", r.get);

    auto miss = findIndex([5, 6, 7], 9);
    writeln(miss.isNull);
    writeln(miss.get(-1));

    r.nullify();
    writeln(r.isNull);
}
