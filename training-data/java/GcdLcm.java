public class GcdLcm {
    public static int gcd(int a, int b) {
        while (b != 0) {
            int t = b;
            b = a % b;
            a = t;
        }
        return Math.abs(a);
    }

    public static int lcm(int a, int b) {
        return (a == 0 || b == 0) ? 0 : Math.abs(a * b) / gcd(a, b);
    }

    public static void main(String[] args) {
        System.out.println(gcd(48, 18) + " " + lcm(4, 6));
    }
}
