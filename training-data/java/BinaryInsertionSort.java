import java.util.Arrays;

public class BinaryInsertionSort {
    public static void sort(int[] a) {
        for (int i = 1; i < a.length; i++) {
            int key = a[i];
            int lo = 0, hi = i;
            while (lo < hi) {
                int mid = (lo + hi) >>> 1;
                if (a[mid] <= key) lo = mid + 1;
                else hi = mid;
            }
            System.arraycopy(a, lo, a, lo + 1, i - lo);
            a[lo] = key;
        }
    }

    public static void main(String[] args) {
        int[] data = {37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54};
        sort(data);
        System.out.println(Arrays.toString(data));
    }
}
