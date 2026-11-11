import std.stdio;
import std.algorithm : max, min;

int maxArea(const int[] h) {
    size_t lo = 0, hi = h.length - 1;
    int best = 0;
    while (lo < hi) {
        best = max(best, min(h[lo], h[hi]) * cast(int)(hi - lo));
        if (h[lo] < h[hi]) lo++; else hi--;
    }
    return best;
}

void main() {
    writeln(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])); // 49
}
