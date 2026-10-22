void main() {
    int[] nums = new int[25];
    int len = 0;
    for (int n = 1; n <= 50; n += 2) {
        nums[len++] = n;
    }
    for (int idx = 1; idx < len && nums[idx] <= len; idx++) {
        int step = nums[idx];
        int kept = 0;
        for (int j = 0; j < len; j++) {
            if ((j + 1) % step != 0) {
                nums[kept++] = nums[j];
            }
        }
        len = kept;
    }
    for (int i = 0; i < len; i++) {
        stdout.printf(i == 0 ? "%d" : " %d", nums[i]);
    }
    stdout.printf("\n");
}
