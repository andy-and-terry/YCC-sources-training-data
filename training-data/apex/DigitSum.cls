public class DigitSum {
    public static Integer digitSum(Integer n) {
        Integer total = 0;
        while (n > 0) {
            total += Math.mod(n, 10);
            n /= 10;
        }
        return total;
    }

    public static void main() {
        System.debug(digitSum(987654321));
    }
}
