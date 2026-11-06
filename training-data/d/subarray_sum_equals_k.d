// Count contiguous subarrays whose sum equals k (prefix sums + associative array).
import std.stdio;

int countSubarrays(const int[] nums, int k) {
    int[int] seen;
    seen[0] = 1;
    int total = 0, count = 0;
    foreach (x; nums) {
        total += x;
        count += seen.get(total - k, 0);
        seen[total] = seen.get(total, 0) + 1;
    }
    return count;
}

void main() {
    writeln(countSubarrays([1, 1, 1], 2));
}
