import std.stdio, std.range, std.algorithm, std.array;

void main() {
    auto r = iota(1, 11).filter!(x => x % 2 == 0).map!(x => x * x);
    writeln(r.array);
    writeln(iota(1, 6).fold!((a, b) => a * b)(1));
    writeln([3, 1, 2].sort().array, " ", [5, 3, 8].maxElement, " ", [5, 3, 8].minIndex);
    writeln(zip([1, 2, 3], "abc").map!(t => t[1]).array);
    writeln(chain([1, 2], [3], [4, 5]).array);
    writeln(iota(10).chunks(3).map!sum.array);
    writeln([1, 2, 3, 4].take(2), " ", [1, 2, 3, 4].drop(2), " ", [1, 2, 3].retro.array);
    writeln(["b", "a", "c"].sort!((a, b) => a > b).array);
    writeln(cycle([1, 2]).take(5).array);
    writeln([1, 1, 2, 3, 3].uniq.array, " ", [1, 2, 3].canFind(2), " ", [1, 2, 3].countUntil(3));
    writeln(iota(1, 20).until!(x => x * x > 50).array);
    writeln("hello world".splitter(' ').map!(w => w[0 .. 1]).join);
}
