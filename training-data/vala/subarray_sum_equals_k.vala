// Count contiguous subarrays whose sum equals k (prefix sums + HashMap).
using Gee;

int count_subarrays (int[] nums, int k) {
    var seen = new HashMap<int, int> ();
    seen[0] = 1;
    int total = 0, count = 0;
    foreach (int x in nums) {
        total += x;
        if (seen.has_key (total - k)) count += seen[total - k];
        seen[total] = seen.has_key (total) ? seen[total] + 1 : 1;
    }
    return count;
}

void main () {
    print ("%d\n", count_subarrays ({ 1, 1, 1 }, 2));
}
