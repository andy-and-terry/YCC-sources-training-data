import java.util.BitSet;
import java.util.stream.IntStream;

public class PartitionEqualSubset {
    public static boolean canPartition(int[] nums) {
        int total = IntStream.of(nums).sum();
        if (total % 2 != 0) return false;
        int target = total / 2;
        boolean[] dp = new boolean[target + 1];
        dp[0] = true;
        for (int x : nums) for (int s = target; s >= x; s--) dp[s] |= dp[s - x];
        return dp[target];
    }

    /** Counts subsets reaching each sum using a BitSet shift-or (sums only, not counts). */
    public static BitSet reachableSums(int[] nums) {
        BitSet bs = new BitSet();
        bs.set(0);
        for (int x : nums) {
            BitSet shifted = new BitSet();
            bs.stream().forEach(i -> shifted.set(i + x));
            bs.or(shifted);
        }
        return bs;
    }

    public static void main(String[] args) {
        System.out.println(canPartition(new int[] {1, 5, 11, 5}) + " " + canPartition(new int[] {1, 2, 3, 5}));
        System.out.println(reachableSums(new int[] {3, 5, 7}));
    }
}
