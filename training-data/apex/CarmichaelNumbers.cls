// Carmichael numbers via Korselt's criterion: n is squarefree, composite,
// and p - 1 divides n - 1 for every prime factor p.
public class CarmichaelNumbers {
    static Boolean isCarmichael(Integer n) {
        Integer m = n;
        Integer count = 0;
        for (Integer p = 2; p * p <= m; p++) {
            if (Math.mod(m, p) == 0) {
                m = m / p;
                if (Math.mod(m, p) == 0) return false;
                if (Math.mod(n - 1, p - 1) != 0) return false;
                count++;
            }
        }
        if (m > 1) {
            if (Math.mod(n - 1, m - 1) != 0) return false;
            count++;
        }
        return count >= 2;
    }

    public static void run() {
        List<String> out = new List<String>();
        for (Integer n = 3; n < 3000; n += 2) {
            if (isCarmichael(n)) out.add(String.valueOf(n));
        }
        System.debug(String.join(out, ' '));
    }
}
