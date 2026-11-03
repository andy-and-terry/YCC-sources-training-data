public class DigitSquareSum {
    static int digitSquareSum(int n) {
        n = Math.abs(n);
        int sum = 0;
        while (n > 0) {
            int d = n % 10;
            sum += d * d;
            n /= 10;
        }
        return sum;
    }

    public static void main(String[] args) {
        System.out.println(digitSquareSum(123));
        System.out.println(digitSquareSum(-99));
    }
}
