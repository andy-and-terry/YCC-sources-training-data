import std.stdio;
import std.algorithm : sort, uniq, setIntersection, setDifference, setUnion;
import std.array : array;

void main() {
    auto a = [5, 1, 3, 3, 9, 1];
    auto b = [3, 4, 5, 6];
    auto sa = a.dup.sort.uniq.array;
    auto sb = b.dup.sort.array;
    writeln(sa);
    writeln(setIntersection(sa, sb));
    writeln(setDifference(sa, sb));
    writeln(setUnion(sa, sb));
}
