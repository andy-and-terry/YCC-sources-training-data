import std.stdio;
import std.typecons;

Nullable!int findIndex(int[] arr, int target) {
    foreach (i, v; arr) {
        if (v == target)
            return nullable(cast(int) i);
    }
    return Nullable!int.init;
}

void main() {
    auto data = [10, 20, 30];

    auto hit = findIndex(data, 20);
    auto miss = findIndex(data, 99);

    if (!hit.isNull)
        writeln("found at ", hit.get);
    writeln("miss is null: ", miss.isNull);
    writeln("with default: ", miss.get(-1));

    hit = Nullable!int.init;
    writeln("after nullify: ", hit.isNull);
}
