import java.util.Arrays;

public class ProductExceptSelf {
    public static long[] compute(int[] nums) {
        int n = nums.length;
        long[] out = new long[n];
        long prefix = 1;
        for (int i = 0; i < n; i++) {
            out[i] = prefix;
            prefix *= nums[i];
        }
        long suffix = 1;
        for (int i = n - 1; i >= 0; i--) {
            out[i] *= suffix;
            suffix *= nums[i];
        }
        return out;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(compute(new int[] {1, 2, 3, 4})));
        System.out.println(Arrays.toString(compute(new int[] {-1, 1, 0, -3, 3})));
    }
}
