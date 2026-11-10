public class Emirps {
    public static Boolean isPrime(Long n) {
        if (n < 2) return false;
        for (Long i = 2; i * i <= n; i++) if (Math.mod(n, i) == 0) return false;
        return true;
    }

    public static List<Long> first(Integer count) {
        List<Long> out = new List<Long>();
        for (Long n = 2; out.size() < count; n++) {
            Long r = Long.valueOf(String.valueOf(n).reverse());
            if (r != n && isPrime(n) && isPrime(r)) out.add(n);
        }
        return out;
    }

    public static void run() {
        System.debug(first(10)); // (13, 17, 31, 37, 71, 73, 79, 97, 107, 113)
    }
}
