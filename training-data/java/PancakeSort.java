import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PancakeSort {
    private static void flip(int[] a, int k) {
        for (int i = 0; i < k; i++, k--) {
            int t = a[i];
            a[i] = a[k];
            a[k] = t;
        }
    }

    /** Sorts in place and returns the sequence of flip sizes performed. */
    public static List<Integer> sort(int[] a) {
        List<Integer> flips = new ArrayList<>();
        for (int size = a.length; size > 1; size--) {
            int maxIdx = 0;
            for (int i = 1; i < size; i++) if (a[i] > a[maxIdx]) maxIdx = i;
            if (maxIdx == size - 1) continue;
            if (maxIdx > 0) {
                flip(a, maxIdx);
                flips.add(maxIdx + 1);
            }
            flip(a, size - 1);
            flips.add(size);
        }
        return flips;
    }

    public static void main(String[] args) {
        int[] data = {23, 10, 20, 11, 12, 6, 7};
        List<Integer> flips = sort(data);
        System.out.println(Arrays.toString(data) + " flips=" + flips);
    }
}
