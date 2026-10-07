import java.util.Arrays;
import java.util.Optional;

public class PairSumSorted {
    static Optional<int[]> find(int[] nums, int target) {
        int i = 0, j = nums.length - 1;
        while (i < j) {
            int s = nums[i] + nums[j];
            if (s == target) return Optional.of(new int[] {i, j});
            if (s < target) i++; else j--;
        }
        return Optional.empty();
    }

    public static void main(String[] args) {
        System.out.println(find(new int[] {1, 3, 4, 6, 8, 11}, 10).map(Arrays::toString).orElse("none"));
        System.out.println(find(new int[] {1, 2, 3}, 100).map(Arrays::toString).orElse("none"));
    }
}
