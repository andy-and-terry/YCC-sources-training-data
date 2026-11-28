import std.stdio;
import std.algorithm : setIntersection, setUnion, sort;
import std.array : array;

double jaccard(int[] a, int[] b) {
    auto sa = a.dup.sort().release, sb = b.dup.sort().release;
    auto inter = setIntersection(sa, sb).array.length;
    auto uni = setUnion(sa, sb).array.length;
    return uni == 0 ? 1.0 : cast(double) inter / uni;
}

void main() {
    writeln(jaccard([1, 2, 3, 4], [3, 4, 5]));
}
