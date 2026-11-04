import java.util.Arrays;

public class SwapXor {
    static void swap(int[] a, int i, int j) {
        if (i == j) return;
        a[i] ^= a[j];
        a[j] ^= a[i];
        a[i] ^= a[j];
    }

    public static void main(String[] args) {
        int[] a = {12, 34, 56};
        swap(a, 0, 2);
        System.out.println(Arrays.toString(a));
    }
}
