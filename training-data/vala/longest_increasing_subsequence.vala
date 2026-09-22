int length_of_lis(int[] nums) {
    if (nums.length == 0) return 0;

    int[] tails = {};
    foreach (int num in nums) {
        int lo = 0;
        int hi = tails.length;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (tails[mid] < num) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        if (lo == tails.length) {
            tails += num;
        } else {
            tails[lo] = num;
        }
    }
    return tails.length;
}

void main() {
    int[] nums = { 10, 9, 2, 5, 3, 7, 101, 18 };
    stdout.printf("%d\n", length_of_lis(nums));
}
