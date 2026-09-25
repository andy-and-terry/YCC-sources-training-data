public class ContainerWithMostWater {
    record Result(int area, int left, int right) {}

    public static Result maxArea(int[] h) {
        int lo = 0, hi = h.length - 1;
        Result best = new Result(0, 0, 0);
        while (lo < hi) {
            int area = (hi - lo) * Math.min(h[lo], h[hi]);
            if (area > best.area()) best = new Result(area, lo, hi);
            if (h[lo] < h[hi]) lo++;
            else hi--;
        }
        return best;
    }

    public static void main(String[] args) {
        System.out.println(maxArea(new int[] {1, 8, 6, 2, 5, 4, 8, 3, 7}));
    }
}
