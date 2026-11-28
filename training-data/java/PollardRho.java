import java.math.BigInteger;

public class PollardRho {
    static long rho(long n) {
        if (n % 2 == 0) return 2;
        long x = 2, y = 2, d = 1;
        while (d == 1) {
            x = (x * x + 1) % n;
            y = (y * y + 1) % n;
            y = (y * y + 1) % n;
            d = BigInteger.valueOf(Math.abs(x - y)).gcd(BigInteger.valueOf(n)).longValue();
        }
        return d;
    }

    public static void main(String[] args) {
        long n = 8051, p = rho(n);
        System.out.println(n + " = " + p + " * " + n / p);
    }
}
