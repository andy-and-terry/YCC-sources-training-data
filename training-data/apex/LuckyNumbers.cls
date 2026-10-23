public class LuckyNumbers {
    // Start with the odd numbers, then delete every k-th survivor,
    // where k is the next surviving number
    public static List<Integer> lucky(Integer limit) {
        List<Integer> nums = new List<Integer>();
        for (Integer n = 1; n < limit; n += 2) {
            nums.add(n);
        }
        Integer idx = 1;
        while (idx < nums.size() && nums[idx] <= nums.size()) {
            Integer k = nums[idx];
            List<Integer> kept = new List<Integer>();
            for (Integer p = 0; p < nums.size(); p++) {
                if (Math.mod(p + 1, k) != 0) {
                    kept.add(nums[p]);
                }
            }
            nums = kept;
            idx++;
        }
        return nums;
    }

    public static void main() {
        System.debug(lucky(100));
    }
}
