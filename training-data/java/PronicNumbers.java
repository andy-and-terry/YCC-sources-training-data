import java.util.stream.IntStream;

public class PronicNumbers {
    static boolean isPronic(long x) {
        long n = (long) Math.sqrt(x);
        return n * (n + 1) == x;
    }

    public static void main(String[] args) {
        System.out.println(IntStream.range(0, 10).map(n -> n * (n + 1)).boxed().toList());
        // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
        System.out.println(isPronic(56) + " " + isPronic(57)); // true false
    }
}
