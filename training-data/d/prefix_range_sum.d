import std.stdio, std.range, std.algorithm;

struct RangeSum {
    long[] prefix;

    this(int[] values) {
        prefix = [0L] ~ values.map!(v => cast(long) v).cumulativeFold!((a, b) => a + b).array;
    }

    long query(size_t lo, size_t hi) const { return prefix[hi] - prefix[lo]; }
}

void main() {
    auto rs = RangeSum([3, 1, 4, 1, 5, 9, 2, 6]);
    writeln(rs.query(2, 5));
}
