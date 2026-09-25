public class MaxProductSubarray {
    static int maxProduct(int[] nums) {
        int best = nums[0], hi = nums[0], lo = nums[0];
        for (int i = 1; i < nums.length; i++) {
            int x = nums[i];
            if (x < 0) { int t = hi; hi = lo; lo = t; }
            hi = Math.max(x, hi * x);
            lo = Math.min(x, lo * x);
            best = Math.max(best, hi);
        }
        return best;
    }

    public static void main(String[] args) {
        System.out.println(maxProduct(new int[] {2, 3, -2, 4}) + " " + maxProduct(new int[] {-2, 3, -4}));
    }
}
