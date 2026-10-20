import java.util.*;
import java.util.stream.*;

public class StreamFlatMapIterate {
    public static void main(String[] args) {
        List<List<Integer>> nested = List.of(List.of(1, 2), List.of(3), List.of());
        System.out.println(nested.stream().flatMap(List::stream).map(x -> x * x).toList());
        System.out.println(Stream.iterate(1, x -> x * 2).limit(8).toList());
        System.out.println(IntStream.rangeClosed(1, 5).summaryStatistics());
        System.out.println(Stream.of("b", "a", "c").sorted(Comparator.reverseOrder()).toList());
    }
}
