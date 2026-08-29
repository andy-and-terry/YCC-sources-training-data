int[] two_sum(int[] nums, int target) {
    var seen = new Gee.HashMap<int, int>();
    for (int i = 0; i < nums.length; i++) {
        int complement = target - nums[i];
        if (seen.has_key(complement)) {
            return { seen[complement], i };
        }
        seen[nums[i]] = i;
    }
    return {};
}

void main() {
    int[] nums = { 2, 7, 11, 15 };
    foreach (int x in two_sum(nums, 9)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
