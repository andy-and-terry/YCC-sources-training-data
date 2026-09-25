import java.util.Arrays;
import java.util.stream.IntStream;

public class OddEvenSort {
    /** Brick sort; each phase's comparisons are independent, so we run them in parallel. */
    public static void sort(int[] a) {
        boolean[] changed = {true};
        while (changed[0]) {
            changed[0] = false;
            for (int start : new int[] {1, 0}) {
                IntStream.iterate(start, i -> i < a.length - 1, i -> i + 2).parallel().forEach(i -> {
                    if (a[i] > a[i + 1]) {
                        int t = a[i];
                        a[i] = a[i + 1];
                        a[i + 1] = t;
                        changed[0] = true;
                    }
                });
            }
        }
    }

    public static void main(String[] args) {
        int[] data = {34, 2, 10, -9, 5, 3, 1, 99, -4, 0};
        sort(data);
        System.out.println(Arrays.toString(data));
    }
}
