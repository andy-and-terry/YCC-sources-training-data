// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
public class LahNumbers {
    static Long fact(Integer n) {
        Long f = 1;
        for (Integer i = 2; i <= n; i++) f *= i;
        return f;
    }

    static Long comb(Integer n, Integer k) {
        return fact(n) / (fact(k) * fact(n - k));
    }

    public static void run() {
        Integer n = 5;
        List<Long> out = new List<Long>();
        for (Integer k = 1; k <= n; k++) {
            out.add(comb(n - 1, k - 1) * fact(n) / fact(k));
        }
        System.debug(String.join(out, ' '));
    }
}
