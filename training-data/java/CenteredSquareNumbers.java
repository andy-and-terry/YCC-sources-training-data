// Centered square numbers: n^2 + (n+1)^2.
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CenteredSquareNumbers {
    public static void main(String[] args) {
        System.out.println(IntStream.range(0, 10)
                .map(n -> n * n + (n + 1) * (n + 1))
                .mapToObj(Integer::toString)
                .collect(Collectors.joining(" ")));
    }
}
