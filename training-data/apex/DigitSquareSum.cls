public class DigitSquareSum {
    public static Integer compute(Integer n) {
        Integer m = Math.abs(n);
        Integer total = 0;
        while (m > 0) {
            Integer d = Math.mod(m, 10);
            total += d * d;
            m = m / 10;
        }
        return total;
    }

    public static void demo() {
        System.debug(compute(123));
        System.debug(compute(-99));
    }
}
