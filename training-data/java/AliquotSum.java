// Aliquot sum with perfect/abundant/deficient classification.
public class AliquotSum {
    static int aliquot(int n) {
        int s = 0;
        for (int d = 1; d < n; d++) if (n % d == 0) s += d;
        return s;
    }

    public static void main(String[] args) {
        for (int n : new int[]{6, 12, 15, 28}) {
            int a = aliquot(n);
            String kind = Integer.compare(a, n) == 0 ? "perfect" : a > n ? "abundant" : "deficient";
            System.out.println(n + " " + a + " " + kind);
        }
    }
}
