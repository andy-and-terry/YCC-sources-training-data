import std.stdio;
import std.range : assumeSorted;

void main() {
    int[] a = [10, 9, 2, 5, 3, 7, 101, 18];
    int[] tails;
    foreach (x; a) {
        auto i = tails.assumeSorted.lowerBound(x).length;
        if (i == tails.length) tails ~= x; else tails[i] = x;
    }
    writeln(tails.length);
}
