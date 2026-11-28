import std.stdio;
import std.math : abs;
import std.range : zip;
import std.algorithm : map, maxElement;

int chebyshev(int[] a, int[] b) {
    return zip(a, b).map!(t => abs(t[0] - t[1])).maxElement;
}

void main() {
    writeln(chebyshev([1, 2], [4, 6]));
}
