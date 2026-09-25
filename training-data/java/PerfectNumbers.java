public class PerfectNumbers {
    enum Classification { PERFECT, ABUNDANT, DEFICIENT }

    static long aliquotSum(long n) {
        if (n == 1) return 0;
        long sum = 1;
        for (long i = 2; i * i <= n; i++) {
            if (n % i == 0) {
                sum += i;
                if (i != n / i) sum += n / i;
            }
        }
        return sum;
    }

    static Classification classify(long n) {
        long s = aliquotSum(n);
        return s == n ? Classification.PERFECT : s > n ? Classification.ABUNDANT : Classification.DEFICIENT;
    }

    public static void main(String[] args) {
        for (long n : new long[] {6, 12, 28, 13, 8128}) System.out.println(n + " " + classify(n));
    }
}
