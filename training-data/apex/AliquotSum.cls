// Aliquot sum classification.
public class AliquotSum {
    public static Integer aliquot(Integer n) {
        Integer s = 0;
        for (Integer d = 1; d < n; d++) { if (Math.mod(n, d) == 0) { s += d; } }
        return s;
    }
    public static String classify(Integer n) {
        Integer a = aliquot(n);
        return a == n ? 'perfect' : (a > n ? 'abundant' : 'deficient');
    }
}
