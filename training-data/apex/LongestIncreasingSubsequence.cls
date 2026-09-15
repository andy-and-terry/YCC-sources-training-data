public class LongestIncreasingSubsequence {
    public static Integer lengthOfLIS(List<Integer> nums) {
        if (nums.isEmpty()) {
            return 0;
        }
        List<Integer> dp = new List<Integer>();
        for (Integer i = 0; i < nums.size(); i++) {
            dp.add(1);
        }
        Integer best = 1;
        for (Integer i = 1; i < nums.size(); i++) {
            for (Integer j = 0; j < i; j++) {
                if (nums[j] < nums[i] && dp[j] + 1 > dp[i]) {
                    dp[i] = dp[j] + 1;
                }
            }
            if (dp[i] > best) {
                best = dp[i];
            }
        }
        return best;
    }

    public static void main() {
        List<Integer> nums = new List<Integer>{10, 9, 2, 5, 3, 7, 101, 18};
        System.debug(lengthOfLIS(nums));
    }
}
