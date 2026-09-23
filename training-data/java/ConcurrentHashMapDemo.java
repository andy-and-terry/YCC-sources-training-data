import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class ConcurrentHashMapDemo {
    public static void main(String[] args) throws InterruptedException {
        ConcurrentHashMap<String, Integer> wordCounts = new ConcurrentHashMap<>();
        List<String> words = List.of("apple", "banana", "apple", "cherry", "banana", "apple");

        List<Thread> threads = words.stream()
            .map(word -> new Thread(() -> wordCounts.merge(word, 1, Integer::sum)))
            .toList();

        threads.forEach(Thread::start);
        for (Thread thread : threads) thread.join();

        System.out.println(wordCounts);

        wordCounts.computeIfAbsent("date", k -> 0);
        wordCounts.compute("apple", (k, v) -> v == null ? 1 : v + 10);
        wordCounts.forEach((word, count) -> System.out.println(word + " -> " + count));

        long total = wordCounts.reduceValuesToLong(1, Integer::longValue, 0, Long::sum);
        System.out.println("total occurrences: " + total);
    }
}
