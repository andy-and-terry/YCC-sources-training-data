import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.IntStream;

public class MapMerge {
    public static void main(String[] args) {
        var m = new ConcurrentHashMap<String, Integer>();
        IntStream.range(0, 1000).parallel().forEach(i -> m.merge("k" + i % 3, 1, Integer::sum));
        System.out.println(new java.util.TreeMap<>(m));
    }
}
