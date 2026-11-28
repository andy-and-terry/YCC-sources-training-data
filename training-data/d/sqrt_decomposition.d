import std.stdio;
import std.algorithm : sum;
import std.range : chunks;
import std.array : array;

struct SqrtSum {
    int[] a; size_t bs; int[] blk;
    this(int[] arr, size_t block) {
        a = arr; bs = block;
        foreach (c; arr.chunks(block)) blk ~= c.sum;
    }
    int query(size_t l, size_t r) {
        int s = 0;
        for (size_t i = l; i <= r;) {
            if (i % bs == 0 && i + bs - 1 <= r) { s += blk[i / bs]; i += bs; }
            else s += a[i++];
        }
        return s;
    }
}

void main() {
    auto t = SqrtSum([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4);
    writeln(t.query(2, 9));
}
