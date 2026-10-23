import std.stdio;
import std.algorithm : maxElement, map;
import std.range : iota;
import std.typecons : tuple;

// Number of steps to reach 1, memoized in an associative array.
ulong[ulong] cache;

ulong steps(ulong n)
{
    if (n == 1) return 0;
    if (auto p = n in cache) return *p;
    ulong result = 1 + steps(n % 2 == 0 ? n / 2 : 3 * n + 1);
    cache[n] = result;
    return result;
}

ulong[] path(ulong n)
{
    ulong[] result = [n];
    while (n != 1)
    {
        n = n % 2 == 0 ? n / 2 : 3 * n + 1;
        result ~= n;
    }
    return result;
}

void main()
{
    writeln("Path for 6: ", path(6));
    writeln("Steps for 27: ", steps(27));

    auto best = iota(1UL, 10_000UL)
        .map!(i => tuple(steps(i), i))
        .maxElement;
    writefln("Longest chain under 10000: start %s, %s steps", best[1], best[0]);
}
