public class ExtendedGcd {
    public class Result {
        public Integer gcd;
        public Integer x;
        public Integer y;
        public Result(Integer gcd, Integer x, Integer y) {
            this.gcd = gcd;
            this.x = x;
            this.y = y;
        }
    }

    // Returns g = gcd(a, b) along with x, y such that a*x + b*y = g.
    public static Result compute(Integer a, Integer b) {
        if (b == 0) {
            return new Result(a, 1, 0);
        }
        Result sub = compute(b, Math.mod(a, b));
        Integer x = sub.y;
        Integer y = sub.x - (a / b) * sub.y;
        return new Result(sub.gcd, x, y);
    }

    public static void main() {
        Result r = compute(240, 46);
        System.debug('gcd=' + r.gcd + ' x=' + r.x + ' y=' + r.y);
        System.debug('check=' + (240 * r.x + 46 * r.y));
    }
}
