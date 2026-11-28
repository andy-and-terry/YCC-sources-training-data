public class CubanPrimes {
    static Boolean isPrime(Long n) {
        if (n < 2) return false;
        for (Long i = 2; i * i <= n; i++) {
            if (Math.mod(n, i) == 0) return false;
        }
        return true;
    }

    public static List<Long> first(Integer count) {
        List<Long> out = new List<Long>();
        Long y = 1;
        while (out.size() < count) {
            Long p = 3 * y * y + 3 * y + 1;
            if (isPrime(p)) out.add(p);
            y++;
        }
        return out;
    }
}
