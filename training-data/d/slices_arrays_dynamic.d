import std.stdio;

void main() {
    int[] a = [1, 2, 3, 4, 5];
    int[] b = a[1 .. 4];
    b[0] = 99;
    writeln(a, " ", b, " ", a.length, " ", b.capacity >= b.length);
    a ~= 6;
    a = a[0 .. $ - 1] ~ [7, 8];
    writeln(a, " ", a[$ - 1], " ", a[1 .. $]);
    int[5] fixed = [1, 2, 3, 4, 5];
    int[] dynamic = fixed[];
    dynamic[0] = 100;
    writeln(fixed[0], " ", fixed.length);
    int[3][2] grid;
    grid[1][2] = 7;
    writeln(grid);
    auto copy = a.dup;
    copy[0] = -1;
    writeln(a[0], " ", copy[0]);
    int[string] counts;
    foreach (w; ["a", "b", "a"]) counts[w]++;
    writeln(counts["a"], " ", counts.length, " ", "z" in counts ? "has z" : "no z");
    foreach (k, v; counts) if (k == "b") writeln(k, v);
    counts.remove("a");
    writeln(counts.keys, counts.values);
    string s = "héllo";
    writeln(s.length, " ", s[0 .. 1]);
    char[] mutable = "abc".dup;
    mutable[1] = 'X';
    writeln(mutable);
}
