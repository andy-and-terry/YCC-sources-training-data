int equilibrium_index (int[] nums) {
    int total = 0, left = 0;
    foreach (int v in nums) total += v;
    for (int i = 0; i < nums.length; i++) {
        if (left == total - left - nums[i]) return i;
        left += nums[i];
    }
    return -1;
}

void main () {
    print ("%d\n", equilibrium_index ({ 1, 7, 3, 6, 5, 6 })); // 3
}
