import java.util.List;
import java.util.stream.Stream;

public class StreamGeneratorsDemo {
    public static void main(String[] args) {
        List<Long> fibonacci = Stream.iterate(new long[]{0, 1}, p -> new long[]{p[1], p[0] + p[1]})
            .limit(10)
            .map(p -> p[0])
            .toList();
        System.out.println(fibonacci);

        List<Integer> powersOfTwo = Stream.iterate(1, n -> n * 2)
            .takeWhile(n -> n <= 256)
            .toList();
        System.out.println(powersOfTwo);

        int[] counter = {0};
        List<Integer> generated = Stream.generate(() -> counter[0]++)
            .limit(5)
            .toList();
        System.out.println(generated);

        List<String> combined = Stream.concat(
            Stream.of("a", "b"),
            Stream.of("c", "d")
        ).toList();
        System.out.println(combined);
    }
}
