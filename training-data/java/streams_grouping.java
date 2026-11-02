import java.util.*;
import java.util.stream.*;

public class StreamsGrouping {
    public static void main(String[] args) {
        List<String> w = List.of("apple", "avocado", "banana", "blueberry", "cherry");
        Map<Character, List<String>> g = w.stream().collect(Collectors.groupingBy(s -> s.charAt(0)));
        System.out.println(g);
    }
}
