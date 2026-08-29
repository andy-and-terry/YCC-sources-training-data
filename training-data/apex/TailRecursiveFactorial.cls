public class TailRecursiveFactorial {
    public static Long factorial(Integer n) {
        return factorialHelper(n, 1);
    }

    private static Long factorialHelper(Integer n, Long acc) {
        if (n == 0) {
            return acc;
        }
        return factorialHelper(n - 1, acc * n);
    }

    public static void main() {
        System.debug(factorial(15));
    }
}
