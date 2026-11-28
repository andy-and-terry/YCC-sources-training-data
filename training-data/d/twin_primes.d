import std.stdio;

void main() {
    enum n = 50;
    bool[n + 1] composite;
    for (int i = 2; i * i <= n; i++)
        if (!composite[i])
            for (int j = i * i; j <= n; j += i) composite[j] = true;
    for (int p = 3; p + 2 <= n; p++)
        if (!composite[p] && !composite[p + 2]) writef("(%d, %d) ", p, p + 2);
    writeln();
}
