public class SubsetSum {
    public static Boolean hasSubsetWithSum(List<Integer> nums, Integer target) {
        List<List<Boolean>> dp = new List<List<Boolean>>();
        for (Integer i = 0; i <= nums.size(); i++) {
            List<Boolean> row = new List<Boolean>();
            for (Integer s = 0; s <= target; s++) {
                row.add(false);
            }
            dp.add(row);
        }
        for (Integer i = 0; i <= nums.size(); i++) {
            dp[i][0] = true;
        }

        for (Integer i = 1; i <= nums.size(); i++) {
            for (Integer s = 1; s <= target; s++) {
                dp[i][s] = dp[i - 1][s];
                if (nums[i - 1] <= s && dp[i - 1][s - nums[i - 1]]) {
                    dp[i][s] = true;
                }
            }
        }
        return dp[nums.size()][target];
    }

    public static void main() {
        List<Integer> nums = new List<Integer>{3, 34, 4, 12, 5, 2};
        System.debug(hasSubsetWithSum(nums, 9));
        System.debug(hasSubsetWithSum(nums, 10));
    }
}
