public class KadaneWithIndices {
    public static void main(String[] args) {
        int[] a = {-2, 1, -3, 4, -1, 2, 1, -5, 4};
        int best = a[0], cur = a[0], start = 0, bestStart = 0, bestEnd = 0;
        for (int i = 1; i < a.length; i++) {
            if (cur < 0) {
                cur = a[i];
                start = i;
            } else {
                cur += a[i];
            }
            if (cur > best) {
                best = cur;
                bestStart = start;
                bestEnd = i;
            }
        }
        System.out.println("sum=" + best + " from " + bestStart + " to " + bestEnd);
    }
}
