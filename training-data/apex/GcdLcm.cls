public class GcdLcm {
    public static Integer gcd(Integer a, Integer b) {
        while (b != 0) {
            Integer t = b;
            b = Math.mod(a, b);
            a = t;
        }
        return a;
    }

    public static Integer lcm(Integer a, Integer b) {
        return (a * b) / gcd(a, b);
    }

    public static void main() {
        System.debug(gcd(48, 18));
        System.debug(lcm(4, 6));
    }
}
