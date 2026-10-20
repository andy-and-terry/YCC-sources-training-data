import java.util.*;
import java.util.stream.*;

public class StreamGroupingCollector {
    public static void main(String[] args) {
        List<String> words = List.of("apple", "avocado", "banana", "blueberry", "cherry");
        Map<Character, List<String>> byInitial =
            words.stream().collect(Collectors.groupingBy(w -> w.charAt(0), TreeMap::new, Collectors.toList()));
        Map<Boolean, Long> longShort =
            words.stream().collect(Collectors.partitioningBy(w -> w.length() > 6, Collectors.counting()));
        System.out.println(byInitial);
        System.out.println(longShort);
    }
}
