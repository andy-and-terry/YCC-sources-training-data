public class MaxSubarray {
    public static int maxSubarray(int[] nums) {
        int best = nums[0];
        int current = nums[0];
        for (int i = 1; i < nums.length; i++) {
            current = Math.max(nums[i], current + nums[i]);
            best = Math.max(best, current);
        }
        return best;
    }

    public static void main(String[] args) {
        System.out.println(maxSubarray(new int[] {-2, 1, -3, 4, -1, 2, 1, -5, 4}));
    }
}
