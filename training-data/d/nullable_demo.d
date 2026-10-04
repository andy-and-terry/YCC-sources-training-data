import std.stdio;
import std.typecons : Nullable, nullable;

Nullable!int findIndex(int[] values, int target) {
    foreach (i, v; values) {
        if (v == target) return nullable(cast(int) i);
    }
    return Nullable!int.init;
}

void main() {
    auto data = [4, 8, 15, 16, 23, 42];

    auto hit = findIndex(data, 15);
    if (!hit.isNull) {
        writeln("found at ", hit.get);
    }

    auto miss = findIndex(data, 7);
    writeln(miss.isNull);
    writeln(miss.get(-1));

    miss = 3;
    writeln(miss);
    miss.nullify();
    writeln(miss.isNull);
}
