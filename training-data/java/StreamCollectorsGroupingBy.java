import java.util.*;
import java.util.stream.*;

public class StreamCollectorsGroupingBy {
    public static void main(String[] args) {
        List<String> w = List.of("apple", "avocado", "banana", "blueberry", "cherry");
        Map<Character, List<String>> g = w.stream().collect(Collectors.groupingBy(s -> s.charAt(0), TreeMap::new, Collectors.toList()));
        System.out.println(g);
        System.out.println(w.stream().collect(Collectors.joining(",", "[", "]")));
        System.out.println(w.stream().mapToInt(String::length).summaryStatistics());
    }
}
