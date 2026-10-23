public class TrappingRainWater {
    static int trap(int[] h) {
        int l = 0, r = h.length - 1, lmax = 0, rmax = 0, total = 0;
        while (l < r) {
            if (h[l] < h[r]) {
                lmax = Math.max(lmax, h[l]);
                total += lmax - h[l++];
            } else {
                rmax = Math.max(rmax, h[r]);
                total += rmax - h[r--];
            }
        }
        return total;
    }

    public static void main(String[] args) {
        System.out.println(trap(new int[]{0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1}));
        System.out.println(trap(new int[]{4, 2, 0, 3, 2, 5}));
        System.out.println(trap(new int[]{1, 2, 3}));
    }
}
