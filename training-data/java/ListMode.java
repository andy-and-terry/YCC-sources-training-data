import java.util.*;
import java.util.stream.*;

public class ListMode {
    static List<Integer> modes(List<Integer> items) {
        Map<Integer, Long> counts = items.stream()
            .collect(Collectors.groupingBy(x -> x, TreeMap::new, Collectors.counting()));
        long top = Collections.max(counts.values());
        return counts.entrySet().stream()
            .filter(e -> e.getValue() == top)
            .map(Map.Entry::getKey)
            .collect(Collectors.toList());
    }

    public static void main(String[] args) {
        System.out.println(modes(List.of(1, 2, 2, 3, 3, 4)));
    }
}
