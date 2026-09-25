public class MaxProductSubarray {
    public static long maxProduct(int[] nums) {
        long best = nums[0], hi = nums[0], lo = nums[0];
        for (int i = 1; i < nums.length; i++) {
            long x = nums[i];
            if (x < 0) {
                long t = hi;
                hi = lo;
                lo = t;
            }
            hi = Math.max(x, hi * x);
            lo = Math.min(x, lo * x);
            best = Math.max(best, hi);
        }
        return best;
    }

    public static void main(String[] args) {
        System.out.println(maxProduct(new int[] {2, 3, -2, 4}) + " " + maxProduct(new int[] {-2, 0, -1}) + " " + maxProduct(new int[] {-2, 3, -4}));
    }
}
