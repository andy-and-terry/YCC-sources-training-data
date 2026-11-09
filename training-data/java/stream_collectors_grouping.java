import java.util.*;
import java.util.stream.*;

public class StreamCollectorsGrouping {
    public static void main(String[] args) {
        List<String> words = List.of("apple", "avocado", "banana", "blueberry", "cherry");
        Map<Character, List<String>> g = words.stream()
            .collect(Collectors.groupingBy(w -> w.charAt(0)));
        System.out.println(g);
        System.out.println(words.stream().collect(Collectors.joining(", ")));
    }
}
