public class AlternatingDigitSum {
    static int alternatingDigitSum(int n) {
        int total = 0, sign = 1;
        for (; n > 0; n /= 10, sign = -sign) total += sign * (n % 10);
        return total;
    }

    public static void main(String[] args) {
        for (int n : new int[] {1234, 99999, 1000})
            System.out.println(n + " " + alternatingDigitSum(n));
    }
}
