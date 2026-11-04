import java.util.Arrays;

public class GcdOfArray {
    static int gcd(int a, int b) {
        return b == 0 ? Math.abs(a) : gcd(b, a % b);
    }

    static int gcdAll(int... nums) {
        return Arrays.stream(nums).reduce(0, GcdOfArray::gcd);
    }

    public static void main(String[] args) {
        System.out.println(gcdAll(12, 18, 24));
        System.out.println(gcdAll(7, 13));
    }
}
