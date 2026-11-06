// Count contiguous subarrays whose sum equals k (prefix sums + HashMap).
import java.util.HashMap;
import java.util.Map;

public class SubarraySumEqualsK {
    static int count(int[] nums, int k) {
        Map<Integer, Integer> seen = new HashMap<>();
        seen.put(0, 1);
        int total = 0, count = 0;
        for (int x : nums) {
            total += x;
            count += seen.getOrDefault(total - k, 0);
            seen.merge(total, 1, Integer::sum);
        }
        return count;
    }

    public static void main(String[] args) {
        System.out.println(count(new int[] {1, 1, 1}, 2));
    }
}
