import std.stdio;
import std.algorithm : partition;
import std.range : chunks, iota, slide;
import std.array : array;

void main() {
    auto a = [1, 2, 3, 4, 5, 6, 7, 8];
    auto mid = a.partition!(x => x % 2 == 1);
    writeln(a[0 .. $ - mid.length].length, " odds");
    writeln(iota(10).chunks(4));
    writeln(iota(5).slide(3).array);
}
