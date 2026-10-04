import std.stdio;
import std.typecons : Nullable, nullable;

Nullable!int findIndex(int[] arr, int x)
{
    foreach (i, v; arr)
        if (v == x)
            return nullable(cast(int) i);
    return Nullable!int.init;
}

void main()
{
    auto arr = [5, 8, 13];
    auto hit = findIndex(arr, 8);
    auto miss = findIndex(arr, 4);

    if (!hit.isNull)
        writeln("index = ", hit.get);
    writeln("miss isNull = ", miss.isNull);
    writeln("miss or default = ", miss.get(-1));
}
