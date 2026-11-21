// Amicable pairs below 1500 via sums of proper divisors.
public class AmicablePairs {
    static Integer s(Integer n) {
        Integer t = 0;
        for (Integer d = 1; d < n; d++) {
            if (Math.mod(n, d) == 0) t += d;
        }
        return t;
    }

    public static void run() {
        for (Integer a = 2; a < 1500; a++) {
            Integer b = s(a);
            if (b > a && s(b) == a) System.debug(a + ' ' + b);
        }
    }
}
