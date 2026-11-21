// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
public class PerfectTotientNumbers {
    static Integer gcd(Integer a, Integer b) {
        return b == 0 ? a : gcd(b, Math.mod(a, b));
    }

    static Integer phi(Integer n) {
        Integer c = 0;
        for (Integer k = 1; k <= n; k++) {
            if (gcd(k, n) == 1) c++;
        }
        return c;
    }

    static Boolean isPerfectTotient(Integer n) {
        Integer total = 0;
        Integer m = n;
        while (m > 1) {
            m = phi(m);
            total += m;
        }
        return total == n;
    }

    public static void run() {
        List<String> out = new List<String>();
        for (Integer n = 2; n < 200; n++) {
            if (isPerfectTotient(n)) out.add(String.valueOf(n));
        }
        System.debug(String.join(out, ' '));
    }
}
