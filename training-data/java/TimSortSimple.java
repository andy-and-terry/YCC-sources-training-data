import java.util.Arrays;
import java.util.Random;

public class TimSortSimple {
    private static final int MIN_RUN = 32;

    public static void sort(int[] a) {
        int n = a.length;
        for (int lo = 0; lo < n; lo += MIN_RUN) insertionSort(a, lo, Math.min(lo + MIN_RUN - 1, n - 1));
        int[] buf = new int[n];
        for (int size = MIN_RUN; size < n; size *= 2) {
            for (int lo = 0; lo < n; lo += 2 * size) {
                int mid = Math.min(lo + size - 1, n - 1);
                int hi = Math.min(lo + 2 * size - 1, n - 1);
                if (mid < hi) merge(a, buf, lo, mid, hi);
            }
        }
    }

    private static void insertionSort(int[] a, int lo, int hi) {
        for (int i = lo + 1; i <= hi; i++) {
            int key = a[i], j = i - 1;
            while (j >= lo && a[j] > key) a[j + 1] = a[j--];
            a[j + 1] = key;
        }
    }

    private static void merge(int[] a, int[] buf, int lo, int mid, int hi) {
        System.arraycopy(a, lo, buf, lo, hi - lo + 1);
        int i = lo, j = mid + 1, k = lo;
        while (i <= mid && j <= hi) a[k++] = buf[i] <= buf[j] ? buf[i++] : buf[j++];
        while (i <= mid) a[k++] = buf[i++];
        while (j <= hi) a[k++] = buf[j++];
    }

    public static void main(String[] args) {
        int[] data = new Random(42).ints(500, 0, 1000).toArray();
        int[] expected = data.clone();
        Arrays.sort(expected);
        sort(data);
        System.out.println("matches Arrays.sort: " + Arrays.equals(data, expected));
    }
}
