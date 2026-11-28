import std.stdio;
import std.algorithm : sum;

int equilibriumIndex(const int[] nums) {
    const total = nums.sum;
    int left = 0;
    foreach (i, v; nums) {
        if (left == total - left - v) return cast(int) i;
        left += v;
    }
    return -1;
}

void main() {
    writeln(equilibriumIndex([1, 7, 3, 6, 5, 6])); // 3
}
