public class PrimeFactorization {
    public static List<Integer> factorize(Integer n) {
        List<Integer> factors = new List<Integer>();
        for (Integer p = 2; p * p <= n; p++) {
            while (Math.mod(n, p) == 0) {
                factors.add(p);
                n = n / p;
            }
        }
        if (n > 1) {
            factors.add(n);
        }
        return factors;
    }

    public static void main() {
        System.debug(factorize(84));
        System.debug(factorize(97));
        System.debug(factorize(360));
    }
}
