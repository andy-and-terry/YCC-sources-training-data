import java.util.Arrays;

// Bead (gravity) sort for non-negative integers.
public class BeadSort {
    static int[] sort(int[] nums) {
        int max = Arrays.stream(nums).max().getAsInt();
        int[] cols = new int[max];
        for (int n : nums) for (int i = 0; i < n; i++) cols[i]++;
        int[] out = new int[nums.length];
        for (int r = 0; r < nums.length; r++) {
            final int row = r;
            out[nums.length - 1 - r] = (int) Arrays.stream(cols).filter(c -> c > row).count();
        }
        return out;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(sort(new int[]{5, 3, 1, 4, 2})));
    }
}
