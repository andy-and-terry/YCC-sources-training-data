import java.util.function.DoubleUnaryOperator;

public class TernarySearch {
    public static int search(int[] a, int target) {
        int lo = 0, hi = a.length - 1;
        while (lo <= hi) {
            int m1 = lo + (hi - lo) / 3;
            int m2 = hi - (hi - lo) / 3;
            if (a[m1] == target) return m1;
            if (a[m2] == target) return m2;
            if (target < a[m1]) hi = m1 - 1;
            else if (target > a[m2]) lo = m2 + 1;
            else {
                lo = m1 + 1;
                hi = m2 - 1;
            }
        }
        return -1;
    }

    public static double argmax(DoubleUnaryOperator f, double lo, double hi) {
        for (int iter = 0; iter < 200; iter++) {
            double m1 = lo + (hi - lo) / 3, m2 = hi - (hi - lo) / 3;
            if (f.applyAsDouble(m1) < f.applyAsDouble(m2)) lo = m1;
            else hi = m2;
        }
        return (lo + hi) / 2;
    }

    public static void main(String[] args) {
        System.out.println(search(new int[] {1, 3, 5, 7, 9, 11, 13}, 9));
        System.out.printf("%.6f%n", argmax(x -> -(x - 2) * (x - 2) + 3, -10, 10));
    }
}
