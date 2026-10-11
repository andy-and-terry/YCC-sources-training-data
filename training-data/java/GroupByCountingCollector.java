import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

public class GroupByCountingCollector {
    public static void main(String[] args) {
        List<String> names = List.of("Ann", "Bob", "Carl", "Dana", "Eve", "Frank", "Gus");
        Map<Integer, Long> byLength = names.stream()
                .collect(Collectors.groupingBy(String::length, TreeMap::new, Collectors.counting()));
        System.out.println(byLength);

        Map<Character, String> joined = names.stream()
                .collect(Collectors.groupingBy(n -> n.charAt(0) < 'D' ? 'L' : 'H',
                        TreeMap::new, Collectors.joining("/")));
        System.out.println(joined);
    }
}
