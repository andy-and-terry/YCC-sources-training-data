import java.util.stream.IntStream;

public class DeficientNumbers {
    static int sigma(int n) {
        return IntStream.rangeClosed(1, n).filter(d -> n % d == 0).sum();
    }

    public static void main(String[] args) {
        System.out.println(IntStream.rangeClosed(1, 20).filter(n -> sigma(n) < 2 * n).boxed().toList());
    }
}
