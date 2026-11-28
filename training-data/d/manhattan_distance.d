import std.stdio;
import std.math : abs;
import std.range : zip;
import std.algorithm : map, sum;

int manhattan(int[] a, int[] b) {
    return zip(a, b).map!(t => abs(t[0] - t[1])).sum;
}

void main() {
    writeln(manhattan([1, 2], [4, 6]));
}
