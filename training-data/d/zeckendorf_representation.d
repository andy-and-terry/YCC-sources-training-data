import std.stdio;
import std.array;
import std.conv;

string[] zeckendorf(long n) {
    long[] fibs = [1, 2];
    while (fibs[$ - 1] + fibs[$ - 2] <= n)
        fibs ~= fibs[$ - 1] + fibs[$ - 2];
    string[] parts;
    foreach_reverse (f; fibs) {
        if (f <= n) {
            parts ~= f.to!string;
            n -= f;
        }
    }
    return parts;
}

void main() {
    writeln(zeckendorf(100).join(" "));
}
