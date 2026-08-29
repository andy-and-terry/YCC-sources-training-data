public class TwoSum {
    public static List<Integer> twoSum(List<Integer> nums, Integer target) {
        Map<Integer, Integer> seen = new Map<Integer, Integer>();
        for (Integer i = 0; i < nums.size(); i++) {
            Integer complement = target - nums[i];
            if (seen.containsKey(complement)) {
                return new List<Integer>{seen.get(complement), i};
            }
            seen.put(nums[i], i);
        }
        return new List<Integer>();
    }

    public static void main() {
        List<Integer> nums = new List<Integer>{2, 7, 11, 15};
        System.debug(twoSum(nums, 9));
    }
}
