import std.stdio;

int fourSumCount(int[] a, int[] b, int[] c, int[] d) {
    int[int] sums;
    foreach (x; a)
        foreach (y; b)
            sums[x + y]++;
    int count = 0;
    foreach (x; c)
        foreach (y; d)
            if (auto p = (-(x + y)) in sums)
                count += *p;
    return count;
}

void main() {
    writeln(fourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2])); // 2
}
