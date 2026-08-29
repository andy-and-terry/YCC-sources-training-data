public class SieveOfEratosthenes {
    public static List<Integer> primesUpTo(Integer n) {
        List<Boolean> isComposite = new List<Boolean>();
        for (Integer i = 0; i <= n; i++) {
            isComposite.add(false);
        }
        List<Integer> primes = new List<Integer>();
        for (Integer p = 2; p <= n; p++) {
            if (!isComposite[p]) {
                primes.add(p);
                for (Integer m = p * p; m <= n; m += p) {
                    isComposite[m] = true;
                }
            }
        }
        return primes;
    }

    public static void main() {
        System.debug(primesUpTo(50));
    }
}
