import java.util.Arrays;

public class CocktailShakerSort {
    public static void sort(int[] a) {
        int lo = 0, hi = a.length - 1;
        boolean swapped = true;
        while (swapped) {
            swapped = false;
            for (int i = lo; i < hi; i++) {
                if (a[i] > a[i + 1]) {
                    swap(a, i, i + 1);
                    swapped = true;
                }
            }
            hi--;
            for (int i = hi; i > lo; i--) {
                if (a[i - 1] > a[i]) {
                    swap(a, i - 1, i);
                    swapped = true;
                }
            }
            lo++;
        }
    }

    private static void swap(int[] a, int i, int j) {
        int t = a[i];
        a[i] = a[j];
        a[j] = t;
    }

    public static void main(String[] args) {
        int[] data = {5, 1, 4, 2, 8, 0, 2};
        sort(data);
        System.out.println(Arrays.toString(data));
    }
}
