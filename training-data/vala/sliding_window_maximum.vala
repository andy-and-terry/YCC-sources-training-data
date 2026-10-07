int[] sliding_window_maximum(int[] nums, int k) {
    int[] result = {};
    int[] deque = new int[nums.length];
    int head = 0, tail = 0;

    for (int i = 0; i < nums.length; i++) {
        while (tail > head && nums[deque[tail - 1]] <= nums[i]) {
            tail--;
        }
        deque[tail++] = i;

        if (deque[head] <= i - k) {
            head++;
        }
        if (i >= k - 1) {
            result += nums[deque[head]];
        }
    }
    return result;
}

void main() {
    int[] nums = { 1, 3, -1, -3, 5, 3, 6, 7 };
    int[] result = sliding_window_maximum(nums, 3);
    foreach (int v in result) {
        stdout.printf("%d ", v);
    }
    stdout.printf("\n");
}
