public class FindPeakElement {
    static int findPeak(int[] a) {
        int lo = 0, hi = a.length - 1;
        while (lo < hi) {
            int mid = (lo + hi) >>> 1;
            if (a[mid] < a[mid + 1]) lo = mid + 1;
            else hi = mid;
        }
        return lo;
    }

    public static void main(String[] args) {
        int[] a = {1, 2, 1, 3, 5, 6, 4};
        int p = findPeak(a);
        System.out.println("peak index " + p + " value " + a[p]);
        System.out.println(findPeak(new int[]{1, 2, 3, 4}));
    }
}
