public class ContainerMostWater {
    static int maxArea(int[] h) {
        int lo = 0, hi = h.length - 1, best = 0;
        while (lo < hi) {
            best = Math.max(best, Math.min(h[lo], h[hi]) * (hi - lo));
            if (h[lo] < h[hi]) lo++;
            else hi--;
        }
        return best;
    }

    public static void main(String[] args) {
        System.out.println(maxArea(new int[] {1, 8, 6, 2, 5, 4, 8, 3, 7})); // 49
    }
}
