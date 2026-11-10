public class SophieGermainPrimes {
    public static Boolean isPrime(Long n) {
        if (n < 2) return false;
        for (Long i = 2; i * i <= n; i++) if (Math.mod(n, i) == 0) return false;
        return true;
    }

    public static void run() {
        List<Long> found = new List<Long>();
        for (Long p = 2; found.size() < 10; p++) {
            if (isPrime(p) && isPrime(2 * p + 1)) found.add(p);
        }
        System.debug(found); // (2, 3, 5, 11, 23, 29, 41, 53, 83, 89)
    }
}
