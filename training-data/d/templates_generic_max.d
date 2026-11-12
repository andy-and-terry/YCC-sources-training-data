import std.stdio;
T maxOf(T)(T a, T b) { return a > b ? a : b; }
void main() { writeln(maxOf(3, 7), " ", maxOf("a", "b"), " ", maxOf(1.5, 0.5)); }
