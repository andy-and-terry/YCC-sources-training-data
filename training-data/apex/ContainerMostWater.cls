public class ContainerMostWater {
    public static Integer maxArea(List<Integer> h) {
        Integer lo = 0, hi = h.size() - 1, best = 0;
        while (lo < hi) {
            best = Math.max(best, Math.min(h[lo], h[hi]) * (hi - lo));
            if (h[lo] < h[hi]) lo++; else hi--;
        }
        return best;
    }

    public static void demo() {
        System.debug(maxArea(new List<Integer>{1, 8, 6, 2, 5, 4, 8, 3, 7})); // 49
    }
}
