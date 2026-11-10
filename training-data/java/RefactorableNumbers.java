import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class RefactorableNumbers {
    static long tau(int n) {
        return IntStream.rangeClosed(1, n).filter(d -> n % d == 0).count();
    }

    public static void main(String[] args) {
        String s = IntStream.range(1, 60).filter(n -> n % tau(n) == 0)
                .mapToObj(Integer::toString).collect(Collectors.joining(" "));
        System.out.println(s); // 1 2 8 9 12 18 24 36 40 56
    }
}
