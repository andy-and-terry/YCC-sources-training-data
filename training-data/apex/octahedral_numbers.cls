public class OctahedralNumbers {
    // n(2n^2+1)/3
    public static Integer term(Integer n) {
        Decimal d = (n * (((2 * n) * n) + 1)) / 3;
        return d.intValue();
    }

    public static void run() {
        for (Integer n = 1; n <= 15; n++) {
            System.debug(n + ' -> ' + term(n));
        }
    }
}
