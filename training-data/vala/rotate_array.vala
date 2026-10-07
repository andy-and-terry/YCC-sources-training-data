void reverse(int[] a, int lo, int hi) {
    while (lo < hi) {
        int tmp = a[lo];
        a[lo] = a[hi];
        a[hi] = tmp;
        lo++;
        hi--;
    }
}

void rotate_right(int[] a, int k) {
    if (a.length == 0) return;
    k = ((k % a.length) + a.length) % a.length;
    reverse(a, 0, a.length - 1);
    reverse(a, 0, k - 1);
    reverse(a, k, a.length - 1);
}

void main() {
    int[] nums = { 1, 2, 3, 4, 5, 6, 7 };
    rotate_right(nums, 3);
    foreach (int v in nums) stdout.printf("%d ", v);
    stdout.printf("\n");
}
