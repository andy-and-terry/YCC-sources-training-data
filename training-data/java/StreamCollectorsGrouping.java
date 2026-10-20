import java.util.*;
import java.util.stream.*;

public class StreamCollectorsGrouping {
    public static void main(String[] args) {
        List<String> words = List.of("apple", "avocado", "banana", "blueberry", "cherry");
        Map<Character, List<String>> byFirst = words.stream().collect(Collectors.groupingBy(w -> w.charAt(0)));
        System.out.println(byFirst);
        Map<Boolean, Long> parts = words.stream().collect(Collectors.partitioningBy(w -> w.length() > 6, Collectors.counting()));
        System.out.println(parts);
        System.out.println(words.stream().collect(Collectors.joining("|", "<", ">")));
        System.out.println(words.stream().collect(Collectors.toMap(w -> w, String::length)).get("cherry"));
    }
}
