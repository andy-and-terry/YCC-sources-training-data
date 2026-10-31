public class MultiplicativePersistence {
    static int persistence(long n) {
        int steps = 0;
        while (n >= 10) {
            long product = 1;
            for (; n > 0; n /= 10) product *= n % 10;
            n = product;
            steps++;
        }
        return steps;
    }

    public static void main(String[] args) {
        for (long n : new long[] {39, 77, 999, 10})
            System.out.println(n + " " + persistence(n));
    }
}
