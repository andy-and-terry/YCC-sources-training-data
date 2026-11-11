// Centered square numbers 2n(n+1)+1
import java.util.stream.Collectors;
import java.util.stream.LongStream;

public class CenteredSquareNumbers {
    static long term(long n) {
        return ((2 * n) * (n + 1)) + 1;
    }

    public static void main(String[] args) {
        System.out.println(LongStream.range(0, 10)
                .mapToObj(n -> String.valueOf(term(n)))
                .collect(Collectors.joining(" ")));
    }
}
