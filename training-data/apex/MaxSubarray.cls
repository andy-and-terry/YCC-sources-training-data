public class MaxSubarray {
    public static Integer maxSubarray(List<Integer> nums) {
        Integer current = nums[0];
        Integer best = nums[0];
        for (Integer i = 1; i < nums.size(); i++) {
            current = Math.max(nums[i], current + nums[i]);
            best = Math.max(best, current);
        }
        return best;
    }

    public static void main() {
        List<Integer> nums = new List<Integer>{-2, 1, -3, 4, -1, 2, 1, -5, 4};
        System.debug(maxSubarray(nums));
    }
}
