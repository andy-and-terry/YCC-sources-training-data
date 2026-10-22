public class LuckyNumbers {
    // Start with odds, then delete every k-th survivor for each surviving k
    public static List<Integer> lucky(Integer limit) {
        List<Integer> nums = new List<Integer>();
        for (Integer v = 1; v <= limit; v += 2) {
            nums.add(v);
        }
        Integer i = 1;
        while (i < nums.size() && nums[i] <= nums.size()) {
            Integer step = nums[i];
            List<Integer> kept = new List<Integer>();
            for (Integer j = 0; j < nums.size(); j++) {
                if (Math.mod(j + 1, step) != 0) {
                    kept.add(nums[j]);
                }
            }
            nums = kept;
            i++;
        }
        return nums;
    }

    public static void main() {
        System.debug(String.join(lucky(50), ' '));
    }
}
