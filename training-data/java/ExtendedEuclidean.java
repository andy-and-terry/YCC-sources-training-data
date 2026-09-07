public class ExtendedEuclidean {
    static class Result {
        long gcd, x, y;

        Result(long gcd, long x, long y) {
            this.gcd = gcd;
            this.x = x;
            this.y = y;
        }
    }

    static Result extendedGcd(long a, long b) {
        if (b == 0) return new Result(a, 1, 0);
        Result sub = extendedGcd(b, a % b);
        return new Result(sub.gcd, sub.y, sub.x - (a / b) * sub.y);
    }

    static long modInverse(long a, long m) {
        Result r = extendedGcd(a, m);
        if (r.gcd != 1) throw new ArithmeticException("no modular inverse exists");
        return ((r.x % m) + m) % m;
    }

    public static void main(String[] args) {
        Result r = extendedGcd(240, 46);
        System.out.println("gcd=" + r.gcd + " x=" + r.x + " y=" + r.y);
        System.out.println(240 * r.x + 46 * r.y);
        System.out.println(modInverse(3, 11));
    }
}
