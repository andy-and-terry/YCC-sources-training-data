public class GcdUtil {
    public static Integer gcd(Integer a, Integer b) {
        a = Math.abs(a);
        b = Math.abs(b);
        while (b != 0) {
            Integer t = Math.mod(a, b);
            a = b;
            b = t;
        }
        return a;
    }

    public static Integer gcdAll(List<Integer> nums) {
        Integer g = 0;
        for (Integer n : nums) g = gcd(g, n);
        return g;
    }
}
