public class PrimeFactorization {
    public static List<Integer> factorize(Integer n) {
        List<Integer> factors = new List<Integer>();
        Integer value = n;
        Integer divisor = 2;
        while (divisor * divisor <= value) {
            while (Math.mod(value, divisor) == 0) {
                factors.add(divisor);
                value /= divisor;
            }
            divisor++;
        }
        if (value > 1) {
            factors.add(value);
        }
        return factors;
    }

    public static void main() {
        System.debug(factorize(360));
        System.debug(factorize(97));
    }
}
