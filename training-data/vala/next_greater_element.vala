int[] next_greater_elements(int[] nums) {
    int n = nums.length;
    int[] result = new int[n];
    for (int i = 0; i < n; i++) {
        result[i] = -1;
    }
    int[] stack = new int[n];
    int top = 0;

    for (int i = 0; i < n; i++) {
        while (top > 0 && nums[stack[top - 1]] < nums[i]) {
            top--;
            result[stack[top]] = nums[i];
        }
        stack[top++] = i;
    }
    return result;
}

void main() {
    int[] nums = { 2, 1, 2, 4, 3 };
    int[] result = next_greater_elements(nums);
    foreach (int v in result) {
        stdout.printf("%d ", v);
    }
    stdout.printf("\n");
}
