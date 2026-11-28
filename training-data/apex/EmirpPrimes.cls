public class EmirpPrimes {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer i = 2; i * i <= n; i++) {
            if (Math.mod(n, i) == 0) return false;
        }
        return true;
    }

    static Integer rev(Integer n) {
        return Integer.valueOf(String.valueOf(n).reverse());
    }

    public static List<Integer> emirps(Integer limit) {
        List<Integer> out = new List<Integer>();
        for (Integer p = 2; p < limit; p++) {
            if (isPrime(p) && rev(p) != p && isPrime(rev(p))) out.add(p);
        }
        return out;
    }
}
