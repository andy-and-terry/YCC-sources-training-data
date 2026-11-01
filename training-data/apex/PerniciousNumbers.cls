public class PerniciousNumbers {
    // Pernicious numbers: the popcount is prime.
    public static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    public static Integer popcount(Integer n) {
        Integer c = 0;
        while (n > 0) {
            c += Math.mod(n, 2);
            n = n / 2;
        }
        return c;
    }

    public static String upToTwenty() {
        List<String> out = new List<String>();
        for (Integer n = 1; n <= 20; n++) {
            if (isPrime(popcount(n))) out.add(String.valueOf(n));
        }
        return String.join(out, ' ');
    }
}
