import java.util.Arrays;

public class CombSort {
    public static void sort(int[] a) {
        int gap = a.length;
        boolean sorted = false;
        while (!sorted) {
            gap = (int) (gap / 1.3);
            if (gap <= 1) {
                gap = 1;
                sorted = true;
            }
            for (int i = 0; i + gap < a.length; i++) {
                if (a[i] > a[i + gap]) {
                    int t = a[i];
                    a[i] = a[i + gap];
                    a[i + gap] = t;
                    sorted = false;
                }
            }
        }
    }

    public static void main(String[] args) {
        int[] data = {8, 4, 1, 56, 3, -44, 23, -6, 28, 0};
        sort(data);
        System.out.println(Arrays.toString(data));
    }
}
