import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class WordFrequency {
    public static Map<String, Long> wordFrequency(String text) {
        return java.util.Arrays.stream(text.toLowerCase().split("\\s+"))
            .map(w -> w.replaceAll("[.,!?;:]", ""))
            .filter(w -> !w.isEmpty())
            .collect(Collectors.groupingBy(w -> w, Collectors.counting()))
            .entrySet()
            .stream()
            .sorted(Comparator.<Map.Entry<String, Long>>comparingLong(Map.Entry::getValue).reversed()
                .thenComparing(Map.Entry::getKey))
            .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (a, b) -> a, LinkedHashMap::new));
    }

    public static void main(String[] args) {
        String text = "the quick brown fox jumps over the lazy dog. The dog barks.";
        wordFrequency(text).forEach((word, count) -> System.out.println(word + ": " + count));
    }
}
