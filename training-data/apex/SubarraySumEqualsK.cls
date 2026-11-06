// Count contiguous subarrays whose sum equals k (prefix sums + Map).
public class SubarraySumEqualsK {
    public static Integer countSubarrays(List<Integer> nums, Integer k) {
        Map<Integer, Integer> seen = new Map<Integer, Integer>{ 0 => 1 };
        Integer total = 0;
        Integer count = 0;
        for (Integer x : nums) {
            total += x;
            if (seen.containsKey(total - k)) count += seen.get(total - k);
            seen.put(total, (seen.containsKey(total) ? seen.get(total) : 0) + 1);
        }
        return count;
    }

    public static void run() {
        System.debug(countSubarrays(new List<Integer>{ 1, 1, 1 }, 2));
    }
}
