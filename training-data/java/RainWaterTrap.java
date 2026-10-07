public class RainWaterTrap {
    /** Prefix/suffix maximum arrays. */
    public static int trap(int[] h) {
        int n = h.length;
        if (n == 0) return 0;
        int[] left = new int[n], right = new int[n];
        left[0] = h[0];
        for (int i = 1; i < n; i++) left[i] = Math.max(left[i - 1], h[i]);
        right[n - 1] = h[n - 1];
        for (int i = n - 2; i >= 0; i--) right[i] = Math.max(right[i + 1], h[i]);
        int water = 0;
        for (int i = 0; i < n; i++) water += Math.min(left[i], right[i]) - h[i];
        return water;
    }

    public static void main(String[] args) {
        System.out.println(trap(new int[] {0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1}) + " " + trap(new int[] {4, 2, 0, 3, 2, 5}));
    }
}
