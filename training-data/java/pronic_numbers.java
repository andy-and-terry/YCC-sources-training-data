// Pronic numbers n(n+1)
import java.util.stream.Collectors;
import java.util.stream.LongStream;

public class PronicNumbers {
    static long term(long n) {
        return n * (n + 1);
    }

    public static void main(String[] args) {
        System.out.println(LongStream.range(0, 10)
                .mapToObj(n -> String.valueOf(term(n)))
                .collect(Collectors.joining(" ")));
    }
}
