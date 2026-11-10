import std.stdio;

void main() {
    enum limit = 80;
    bool[limit + 1] composite;
    for (int i = 2; i * i <= limit; i++)
        if (!composite[i])
            for (int j = i * i; j <= limit; j += i) composite[j] = true;
    for (int p = 3; p + 2 <= limit; p++)
        if (!composite[p] && !composite[p + 2]) writef("(%d,%d) ", p, p + 2);
    writeln(); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
}
