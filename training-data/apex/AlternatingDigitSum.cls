public class AlternatingDigitSum {
    public static Integer alternatingDigitSum(Integer n) {
        Integer total = 0;
        Integer sign = 1;
        while (n > 0) {
            total += sign * Math.mod(n, 10);
            sign = -sign;
            n = n / 10;
        }
        return total;
    }

    public static void main() {
        for (Integer n : new List<Integer>{1234, 99999, 1000}) {
            System.debug(n + ' ' + alternatingDigitSum(n));
        }
    }
}
