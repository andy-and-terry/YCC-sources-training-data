import std.stdio;
import std.typecons;

Nullable!int findIndex(int[] arr, int target) {
    foreach (i, v; arr)
        if (v == target)
            return nullable(cast(int) i);
    return Nullable!int.init;
}

void main() {
    auto data = [10, 20, 30];

    auto hit = findIndex(data, 20);
    auto miss = findIndex(data, 99);

    writeln(hit.isNull);
    writeln(miss.isNull);
    writeln(hit.get);
    writeln(miss.get(-1));

    hit.nullify();
    writeln(hit.isNull);

    Nullable!string name;
    name = "dlang";
    writeln(name);
}
