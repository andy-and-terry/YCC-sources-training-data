public class FactorialVariants {
    public static long recursive(int n) {
        return n <= 1 ? 1 : n * recursive(n - 1);
    }

    public static long iterative(int n) {
        long result = 1;
        for (int i = 2; i <= n; i++) result *= i;
        return result;
    }

    public static void main(String[] args) {
        System.out.println(recursive(5) + " " + iterative(5));
    }
}
