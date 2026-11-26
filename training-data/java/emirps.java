// Emirps below 200; expect 15.
public class Emirps {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        int c = 0;
        for (int n = 2; n < 200; n++) {
            int r = Integer.parseInt(new StringBuilder(String.valueOf(n)).reverse().toString());
            if (r != n && isPrime(n) && isPrime(r)) c++;
        }
        System.out.println(c);
    }
}
