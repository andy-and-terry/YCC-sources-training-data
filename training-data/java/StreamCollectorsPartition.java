import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class StreamCollectorsPartition {
    public static void main(String[] args) {
        List<String> words = List.of("alpha", "beta", "gamma", "pi", "epsilon");
        Map<Boolean, List<String>> parts = words.stream()
                .collect(Collectors.partitioningBy(w -> w.length() > 4));
        System.out.println(parts);
        System.out.println(words.stream().collect(Collectors.joining(", ", "[", "]")));
        System.out.println(words.stream().collect(Collectors.averagingInt(String::length)));
    }
}
