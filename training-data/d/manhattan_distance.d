import std.stdio, std.algorithm, std.range, std.math;
// Manhattan distance using zip.
int manhattan(int[] a, int[] b) { return zip(a, b).map!(t => abs(t[0] - t[1])).sum; }
void main() { writeln(manhattan([1, 2], [4, 6])); }
