import java.util.Arrays;

public class ArrayRotationReversal {
    static void reverse(int[] a, int lo, int hi) {
        while (lo < hi) {
            int t = a[lo];
            a[lo++] = a[hi];
            a[hi--] = t;
        }
    }

    static void rotateLeft(int[] a, int k) {
        int n = a.length;
        k %= n;
        reverse(a, 0, k - 1);
        reverse(a, k, n - 1);
        reverse(a, 0, n - 1);
    }

    public static void main(String[] args) {
        int[] data = {1, 2, 3, 4, 5, 6, 7};
        rotateLeft(data, 3);
        System.out.println(Arrays.toString(data));
    }
}
