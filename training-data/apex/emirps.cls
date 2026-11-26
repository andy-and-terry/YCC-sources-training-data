// Emirps below 200; expect 15.
public class Emirps {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    public static void run() {
        Integer c = 0;
        for (Integer n = 2; n < 200; n++) {
            Integer r = Integer.valueOf(String.valueOf(n).reverse());
            if (r != n && isPrime(n) && isPrime(r)) c++;
        }
        System.debug(c);
    }
}
